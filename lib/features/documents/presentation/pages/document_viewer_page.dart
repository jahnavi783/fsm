import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/document_entity.dart';
import '../../domain/usecases/get_document_by_id_usecase.dart';

@RoutePage()
class DocumentViewerPage extends StatefulWidget {
  final int documentId;

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
  bool _isLoading = true;
  String? _errorMessage;
  int _currentPage = 1;
  int _totalPages = 0;

  @override
  void initState() {
    super.initState();
    _loadDocument();
  }

  @override
  void dispose() {
    _pdfViewerController.dispose();
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  Future<void> _loadDocument() async {
    try {
      final useCase = getIt<GetDocumentByIdUseCase>();
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
            _isLoading = false;
          });
          
          // Initialize video player if document is a video
          if (document.isVideo) {
            _initializeVideoPlayer(document);
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

  Future<void> _initializeVideoPlayer(DocumentEntity document) async {
    try {
      if (document.isAvailableOffline && document.localPath != null) {
        _videoPlayerController =
            VideoPlayerController.file(File(document.localPath!));
      } else {
        _videoPlayerController =
            VideoPlayerController.networkUrl(Uri.parse(document.fileUrl));
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
          bufferedColor: Theme.of(context).colorScheme.primary.withOpacity(0.3),
        ),
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

  Future<void> _launchExternalUrl() async {
    if (_document?.fileUrl != null) {
      final Uri uri = Uri.parse(_document!.fileUrl);
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Could not open ${_document!.fileName}'),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(_document?.title ?? 'Document'),
        elevation: 0,
        backgroundColor: theme.colorScheme.surface,
        foregroundColor: theme.colorScheme.onSurface,
        actions: [
          if (_document != null) ...[
            // Page info for PDFs
            if (_document!.isPdf && _totalPages > 0)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceVariant,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Text(
                      '$_currentPage / $_totalPages',
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
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
          _document?.isPdf == true && !_document!.isVideo
              ? _buildPdfControls()
              : null,
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
    final theme = Theme.of(context);
    
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64.sp,
              color: theme.colorScheme.error,
            ),
            SizedBox(height: 16.h),
            Text(
              message ?? _errorMessage ?? 'An error occurred',
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onSurface,
                fontSize: 16.sp,
              ),
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
    if (_document!.isPdf) {
      return _buildPdfViewer();
    } else if (_document!.isImage) {
      return _buildImageViewer();
    } else if (_document!.isVideo) {
      return _buildVideoViewer();
    } else {
      return _buildUnsupportedFileType();
    }
  }

  Widget _buildPdfViewer() {
    if (_document!.isAvailableOffline) {
      return SfPdfViewer.file(
        File(_document!.localPath!),
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
        _document!.fileUrl,
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
        child: _document!.isAvailableOffline
            ? Image.file(
                File(_document!.localPath!),
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return _buildImageError();
                },
              )
            : Image.network(
                _document!.fileUrl,
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
    final theme = Theme.of(context);
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.broken_image,
          size: 64.sp,
          color: theme.colorScheme.error,
        ),
        SizedBox(height: 16.h),
        Text(
          'Failed to load image',
          style: theme.textTheme.titleMedium?.copyWith(
            color: theme.colorScheme.onSurface,
          ),
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
    final theme = Theme.of(context);
    
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64.sp,
              color: theme.colorScheme.error,
            ),
            SizedBox(height: 16.h),
            Text(
              'Failed to load video',
              style: theme.textTheme.titleMedium?.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              _errorMessage ?? 'An error occurred while loading the video',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.7),
                fontSize: 14.sp,
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
    final theme = Theme.of(context);
    
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.insert_drive_file,
              size: 64.sp,
              color: theme.colorScheme.onSurface.withOpacity(0.5),
            ),
            SizedBox(height: 16.h),
            Text(
              'Preview not available',
              style: theme.textTheme.titleMedium?.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'This file type (${_document!.fileExtension.toUpperCase()}) cannot be previewed in the app.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.7),
                fontSize: 14.sp,
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
    final theme = Theme.of(context);
    
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border(
          top: BorderSide(
            color: theme.colorScheme.outline.withOpacity(0.2),
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
                    title: const Text('Go to page'),
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