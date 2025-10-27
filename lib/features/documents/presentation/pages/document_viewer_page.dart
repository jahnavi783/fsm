import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/fsm_app_bar.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/router/app_router.gr.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/document_entity.dart';
import '../../domain/entities/file_entity.dart';
import '../../domain/usecases/get_document_by_id_usecase.dart';

@RoutePage()
class DocumentViewerPage extends StatefulWidget {
  final String documentId;

  const DocumentViewerPage({
    super.key,
    @PathParam('documentId') required this.documentId,
  });

  @override
  State<DocumentViewerPage> createState() => _DocumentViewerPageState();
}

class _DocumentViewerPageState extends State<DocumentViewerPage> {
  final PdfViewerController _pdfViewerController = PdfViewerController();
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;
  DocumentEntity? _document;
  FileEntity? _selectedFile; // Track selected file for multi-file support
  bool _isLoading = true;
  String? _errorMessage;
  int _currentPage = 1;
  int _totalPages = 0;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _loadDocument();
  }

  @override
  void dispose() {
    _pdfViewerController.dispose();
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadDocument() async {
    try {
      final useCase = await getIt.getAsync<GetDocumentByIdUseCase>();
      final result = await useCase(widget.documentId);

      result.fold(
        (failure) {
          setState(() {
            _errorMessage = failure.userFriendlyMessage;
            _isLoading = false;
          });
        },
        (document) {
          setState(() {
            _document = document;
            // Select first file by default
            _selectedFile =
                document.files.isNotEmpty ? document.files.first : null;
            _isLoading = false;
          });

          // Initialize video player if selected file is a video
          if (_selectedFile?.isVideo == true) {
            _initializeVideoPlayer(_selectedFile!);
          }
        },
      );
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to load document: $e';
        _isLoading = false;
      });
    }
  }

  Future<void> _initializeVideoPlayer(FileEntity file) async {
    try {
      if (file.isAvailableOffline && file.localPath != null) {
        _videoPlayerController =
            VideoPlayerController.file(File(file.localPath!));
      } else {
        _videoPlayerController =
            VideoPlayerController.networkUrl(Uri.parse(file.fileUrl));
      }

      await _videoPlayerController!.initialize();

      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController!,
        autoPlay: true,
        looping: false,
        allowFullScreen: true,
        allowMuting: true,
        showControls: true,
        materialProgressColors: ChewieProgressColors(
            playedColor: Theme.of(context).colorScheme.primary,
            handleColor: Theme.of(context).colorScheme.primary,
            backgroundColor: Colors.grey,
            bufferedColor: Theme.of(context).colorScheme.primary),
      );

      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = 'Failed to load video: $e';
        });
      }
    }
  }

  void _showPdfSearchDialog() {
    _searchController.clear();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Search in PDF',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        content: TextField(
          controller: _searchController,
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Enter search text',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          onSubmitted: (value) {
            if (value.isNotEmpty) {
              // Trigger search when user submits
              _performPdfSearch(value);
              Navigator.of(context).pop();
            }
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              _pdfViewerController.clearSelection();
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_searchController.text.isNotEmpty) {
                _performPdfSearch(_searchController.text);
                Navigator.of(context).pop();
              }
            },
            child: const Text('Search'),
          ),
        ],
      ),
    );
  }

  void _performPdfSearch(String searchText) {
    // Use the PdfViewerController to search
    // Note: The actual search highlighting is handled by Syncfusion's built-in search
    _pdfViewerController.searchText(searchText);
  }

  Future<void> _launchExternalUrl() async {
    final fileUrl = _selectedFile?.fileUrl ?? _document?.fileUrl;
    if (fileUrl != null && fileUrl.isNotEmpty) {
      final Uri uri = Uri.parse(fileUrl);
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Could not open ${_selectedFile?.fileName ?? _document?.fileName}',
              ),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop && !context.router.canPop()) {
          // If can't pop anymore, navigate to main navigation
          context.router.replaceAll([MainNavigationRoute()]);
        }
      },
      child: Scaffold(
        appBar: FSMAppBar.standard(
          title: _document?.title ?? 'Document',
          actions: [
            if (_document != null) ...[
              // File selector for multi-file documents
              if (_document!.files.length > 1)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Center(
                    child: DropdownButton<FileEntity>(
                      value: _selectedFile,
                      dropdownColor: Theme.of(context).colorScheme.surface,
                      underline: SizedBox.shrink(),
                      items: _document!.files.map((file) {
                        return DropdownMenuItem(
                          value: file,
                          child: Text(
                            file.fileName ?? 'File',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontSize: 12.sp,
                                ),
                          ),
                        );
                      }).toList(),
                      onChanged: (file) {
                        if (file != null) {
                          setState(() {
                            _selectedFile = file;
                            // Dispose old controllers and reinitialize if video
                            _videoPlayerController?.dispose();
                            _chewieController?.dispose();
                            _videoPlayerController = null;
                            _chewieController = null;
                            _currentPage = 1;
                            _totalPages = 0;
                          });

                          if (file.isVideo) {
                            _initializeVideoPlayer(file);
                          }
                        }
                      },
                    ),
                  ),
                ),

              // Page info for PDFs
              if (_selectedFile?.isPdf == true && _totalPages > 0)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Text(
                        '$_currentPage / $_totalPages',
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ),
                  ),
                ),

              // Search button for PDFs
              if (_selectedFile?.isPdf == true)
                IconButton(
                  onPressed: _showPdfSearchDialog,
                  icon: const Icon(Icons.search),
                  tooltip: 'Search in PDF',
                ),

              // External launch button
              IconButton(
                onPressed: _launchExternalUrl,
                icon: const Icon(Icons.open_in_new),
                tooltip: 'Open in external app',
              ),
            ],
          ],
        ),
        body: _buildBody(),
        bottomNavigationBar:
            _selectedFile?.isPdf == true && !_selectedFile!.isVideo
                ? _buildPdfControls()
                : null,
      ),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_errorMessage != null) {
      return _buildErrorState();
    }

    if (_document == null) {
      return _buildErrorState(message: 'Document not found');
    }

    return _buildDocumentViewer();
  }

  Widget _buildErrorState({String? message}) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64.sp,
              color: Theme.of(context).colorScheme.error,
            ),
            SizedBox(height: 16.h),
            Text(
              message ?? _errorMessage ?? 'An error occurred',
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            ElevatedButton(
              onPressed: _loadDocument,
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDocumentViewer() {
    if (_selectedFile?.isPdf == true) {
      return _buildPdfViewer();
    } else if (_selectedFile?.isImage == true) {
      return _buildImageViewer();
    } else if (_selectedFile?.isVideo == true) {
      return _buildVideoViewer();
    } else {
      return _buildUnsupportedFileType();
    }
  }

  Widget _buildPdfViewer() {
    if (_selectedFile!.isAvailableOffline) {
      return SfPdfViewer.file(
        File(_selectedFile!.localPath!),
        controller: _pdfViewerController,
        onDocumentLoaded: (PdfDocumentLoadedDetails details) {
          setState(() {
            _totalPages = details.document.pages.count;
          });
        },
        onPageChanged: (PdfPageChangedDetails details) {
          setState(() {
            _currentPage = details.newPageNumber;
          });
        },
        enableDoubleTapZooming: true,
        enableTextSelection: true,
        canShowScrollHead: true,
        canShowScrollStatus: true,
        canShowPaginationDialog: true,
      );
    } else {
      return SfPdfViewer.network(
        _selectedFile!.fileUrl,
        controller: _pdfViewerController,
        onDocumentLoaded: (PdfDocumentLoadedDetails details) {
          setState(() {
            _totalPages = details.document.pages.count;
          });
        },
        onPageChanged: (PdfPageChangedDetails details) {
          setState(() {
            _currentPage = details.newPageNumber;
          });
        },
        enableDoubleTapZooming: true,
        enableTextSelection: true,
        canShowScrollHead: true,
        canShowScrollStatus: true,
        canShowPaginationDialog: true,
      );
    }
  }

  Widget _buildImageViewer() {
    return InteractiveViewer(
      panEnabled: true,
      boundaryMargin: const EdgeInsets.all(20),
      minScale: 0.5,
      maxScale: 4.0,
      child: Center(
        child: _selectedFile!.isAvailableOffline
            ? Image.file(
                File(_selectedFile!.localPath!),
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return _buildImageError();
                },
              )
            : Image.network(
                _selectedFile!.fileUrl,
                fit: BoxFit.contain,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return _buildImageError();
                },
              ),
      ),
    );
  }

  Widget _buildImageError() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.broken_image,
          size: 64.sp,
          color: Theme.of(context).colorScheme.error,
        ),
        SizedBox(height: 16.h),
        Text(
          'Failed to load image',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }

  Widget _buildVideoViewer() {
    if (_chewieController != null &&
        _videoPlayerController != null &&
        _videoPlayerController!.value.isInitialized) {
      return Center(
        child: Chewie(controller: _chewieController!),
      );
    } else if (_errorMessage != null) {
      return _buildVideoError();
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  Widget _buildVideoError() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64.sp,
              color: Theme.of(context).colorScheme.error,
            ),
            SizedBox(height: 16.h),
            Text(
              'Failed to load video',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 8.h),
            Text(
              _errorMessage ?? 'An error occurred while loading the video',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.7),
                  ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            ElevatedButton.icon(
              onPressed: _launchExternalUrl,
              icon: const Icon(Icons.open_in_new),
              label: const Text('Open in external app'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUnsupportedFileType() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.insert_drive_file,
              size: 64.sp,
              color: Theme.of(context)
                  .colorScheme
                  .onSurface
                  .withValues(alpha: 0.5),
            ),
            SizedBox(height: 16.h),
            Text(
              'Preview not available',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 8.h),
            Text(
              'This file type (${_selectedFile!.fileExtension.toUpperCase()}) cannot be previewed in the app.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.7),
                  ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            ElevatedButton.icon(
              onPressed: _launchExternalUrl,
              icon: const Icon(Icons.open_in_new),
              label: const Text('Open in external app'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPdfControls() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(
          top: BorderSide(
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
          ),
        ),
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: _currentPage > 1
                  ? () => _pdfViewerController.previousPage()
                  : null,
              icon: const Icon(Icons.navigate_before),
              tooltip: 'Previous page',
            ),
            IconButton(
              onPressed: () => _pdfViewerController.zoomLevel = 1.0,
              icon: const Icon(Icons.zoom_out_map),
              tooltip: 'Fit to screen',
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                      'Go to page',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    content: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Page number (1-$_totalPages)',
                      ),
                      onSubmitted: (value) {
                        final page = int.tryParse(value);
                        if (page != null && page >= 1 && page <= _totalPages) {
                          _pdfViewerController.jumpToPage(page);
                          Navigator.of(context).pop();
                        }
                      },
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Cancel'),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.format_list_numbered),
              tooltip: 'Go to page',
            ),
            IconButton(
              onPressed: _currentPage < _totalPages
                  ? () => _pdfViewerController.nextPage()
                  : null,
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Next page',
            ),
          ],
        ),
      ),
    );
  }
}
