import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/widgets/fsm_app_bar.dart';
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
  FileEntity? _selectedFile;
  bool _isLoading = true;
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String? _errorMessage;
  int _currentPage = 1;
  int _totalPages = 0;
  late TextEditingController _searchController;

  // Search navigation variables
  PdfTextSearchResult? _currentSearchResult;
  int _currentSearchIndex = 0;
  int _totalSearchResults = 0;
  bool _isSearchActive = false;

  void _onFileChanged(FileEntity file) {
    setState(() {
      _selectedFile = file;
      _videoPlayerController?.dispose();
      _chewieController?.dispose();
      _videoPlayerController = null;
      _chewieController = null;
      _currentPage = 1;
      _totalPages = 0;
      _clearSearch();
    });

    if (file.isVideo) {
      _initializeVideoPlayer(file);
    }
  }

  void _clearSearch() {
    _currentSearchResult?.removeListener(_searchListener);
    _pdfViewerController.clearSelection();
    _currentSearchResult = null;
    _currentSearchIndex = 0;
    _totalSearchResults = 0;
    _isSearchActive = false;
  }

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
    _currentSearchResult?.removeListener(_searchListener);
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
            _selectedFile =
                document.files.isNotEmpty ? document.files.first : null;
            _isLoading = false;
          });

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

      if (!mounted) return;
      final primaryColor = Theme.of(context).colorScheme.primary;
      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController!,
        autoPlay: true,
        looping: false,
        allowFullScreen: true,
        allowMuting: true,
        showControls: true,
        materialProgressColors: ChewieProgressColors(
            playedColor: primaryColor,
            handleColor: primaryColor,
            backgroundColor: Colors.grey,
            bufferedColor: primaryColor),
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

  void _startVoiceSearch() async {
    _speech = stt.SpeechToText();
    bool available = await _speech.initialize();

    if (!available) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Voice recognition not available'),
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    setState(() => _isListening = true);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('🎙 Listening...'),
        duration: Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
      ),
    );

    _speech.listen(
      listenFor: const Duration(seconds: 10),
      pauseFor: const Duration(seconds: 2),
      onResult: (result) {
        if (result.finalResult) {
          final spokenText = result.recognizedWords.trim();

          if (spokenText.isNotEmpty) {
            _searchController.text = spokenText;
            _performPdfSearch(spokenText);
          }

          _stopVoiceSearch();
        }
      },
    );
  }

  void _stopVoiceSearch() {
    _speech.stop();
    setState(() => _isListening = false);
  }

  void _handleVoiceSearch() {
    if (_isListening) {
      _stopVoiceSearch();
    } else {
      _startVoiceSearch();
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
              _performPdfSearch(value);
              Navigator.of(context).pop();
            }
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              _clearSearch();
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          ),
          TextButton(
            onPressed: () {
              _performPdfSearch(_searchController.text);
              Navigator.of(context).pop();
            },
            child: const Text('Search'),
          ),
        ],
      ),
    );
  }

  void _searchListener() {
    if (_currentSearchResult!.isSearchCompleted) {
      setState(() {
        _totalSearchResults = _currentSearchResult!.totalInstanceCount;
        _currentSearchIndex = _currentSearchResult!.currentInstanceIndex;
        _isSearchActive = _totalSearchResults > 0;
      });

      if (_totalSearchResults == 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('No results found for "${_searchController.text}"'),
            duration: const Duration(seconds: 2),
            backgroundColor: Colors.red,
          ),
        );
      }
    } else {
      // Update index while searching is in progress
      setState(() {
        _currentSearchIndex = _currentSearchResult!.currentInstanceIndex;
      });
    }
  }

  void _performPdfSearch(String searchText) {
    if (searchText.isEmpty) return;

    _clearSearch();

    final searchResult = _pdfViewerController.searchText(searchText);
    _currentSearchResult = searchResult;
    _currentSearchResult!.addListener(_searchListener);
  }

  void _navigateToNextSearchResult() {
    if (_currentSearchResult != null && _totalSearchResults > 0) {
      _currentSearchResult!.nextInstance();

      // Update the current index after navigation
      Future.delayed(const Duration(milliseconds: 100), () {
        if (mounted) {
          setState(() {
            _currentSearchIndex = _currentSearchResult!.currentInstanceIndex;
          });
        }
      });
    }
  }

  void _navigateToPreviousSearchResult() {
    if (_currentSearchResult != null && _totalSearchResults > 0) {
      _currentSearchResult!.previousInstance();

      // Update the current index after navigation
      Future.delayed(const Duration(milliseconds: 100), () {
        if (mounted) {
          setState(() {
            _currentSearchIndex = _currentSearchResult!.currentInstanceIndex;
          });
        }
      });
    }
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
    return Scaffold(
      appBar: FSMAppBar.gradient(
        title: _document?.title ?? 'Document',
        actions: [
          if (_document != null)
            _ResponsiveAppBarActions(
              document: _document!,
              selectedFile: _selectedFile,
              onFileChanged: _onFileChanged,
              currentPage: _currentPage,
              totalPages: _totalPages,
              onSearchTap: _showPdfSearchDialog,
              onSearchVoiceTap: _handleVoiceSearch,
              onExternalOpen: _launchExternalUrl,
              isSearchActive: _isSearchActive,
              currentSearchIndex: _currentSearchIndex,
              totalSearchResults: _totalSearchResults,
            ),
        ],
      ),
      body: _buildBody(),
      bottomNavigationBar:
          _selectedFile?.isPdf == true && !_selectedFile!.isVideo
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
            // Search navigation or page navigation
            if (_isSearchActive) ...[
              IconButton(
                onPressed: _navigateToPreviousSearchResult,
                icon: const Icon(Icons.arrow_back),
                tooltip: 'Previous result',
              ),
              Text(
                '$_currentSearchIndex / $_totalSearchResults',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              IconButton(
                onPressed: _navigateToNextSearchResult,
                icon: const Icon(Icons.arrow_forward),
                tooltip: 'Next result',
              ),
              IconButton(
                onPressed: _clearSearch,
                icon: const Icon(Icons.close),
                tooltip: 'Clear search',
              ),
            ] else ...[
              IconButton(
                onPressed: _currentPage > 1
                    ? () => _pdfViewerController.previousPage()
                    : null,
                icon: const Icon(Icons.navigate_before),
                tooltip: 'Previous page',
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
                          if (page != null &&
                              page >= 1 &&
                              page <= _totalPages) {
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
          ],
        ),
      ),
    );
  }
}

class _ResponsiveAppBarActions extends StatelessWidget {
  final DocumentEntity document;
  final FileEntity? selectedFile;
  final ValueChanged<FileEntity> onFileChanged;
  final int currentPage;
  final int totalPages;
  final VoidCallback onSearchTap;
  final VoidCallback onExternalOpen;
  final VoidCallback onSearchVoiceTap;
  final bool isSearchActive;
  final int currentSearchIndex;
  final int totalSearchResults;

  const _ResponsiveAppBarActions({
    required this.document,
    required this.selectedFile,
    required this.onFileChanged,
    required this.currentPage,
    required this.totalPages,
    required this.onSearchTap,
    required this.onExternalOpen,
    required this.onSearchVoiceTap,
    required this.isSearchActive,
    required this.currentSearchIndex,
    required this.totalSearchResults,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (selectedFile?.isPdf == true && isSearchActive)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    '$currentSearchIndex/$totalSearchResults',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              )
            else if (selectedFile?.isPdf == true && totalPages > 0)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  '$currentPage / $totalPages',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            if (selectedFile?.isPdf == true)
              IconButton(
                icon: const Icon(Icons.mic_none),
                onPressed: onSearchVoiceTap,
                tooltip: 'Voice Search',
              ),
            if (selectedFile?.isPdf == true)
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: onSearchTap,
                tooltip: 'Search',
              ),
            IconButton(
              icon: const Icon(Icons.open_in_new),
              onPressed: onExternalOpen,
              tooltip: 'Open externally',
            ),
          ],
        );
      },
    );
  }
}
