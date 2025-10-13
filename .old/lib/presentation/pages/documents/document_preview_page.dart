import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:fsm_flutter/data/entity/document_entity.dart';
import 'package:fsm_flutter/presentation/core/components/gradient_elevated_button.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

class DocumentPreviewPage extends StatefulWidget {
  final DocumentEntity document;

  const DocumentPreviewPage({super.key, required this.document});

  @override
  State<DocumentPreviewPage> createState() => _DocumentPreviewPageState();
}

class _DocumentPreviewPageState extends State<DocumentPreviewPage> {
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    if (isVideo(widget.document.fileType)) {
      _videoPlayerController =
          VideoPlayerController.networkUrl(Uri.parse(widget.document.fileUrl));
      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController!,
        autoPlay: true,
        looping: true,
      );
    }
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  Future<void> _launchUrl() async {
    final Uri uri = Uri.parse(widget.document.fileUrl);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  bool isVideo(String fileType) {
    final videoTypes = ['mp4', 'mov', 'avi', 'mkv', 'webm', 'video/mp4'];
    return videoTypes.contains(fileType.toLowerCase());
  }

  bool isPdf(String fileType) {
    return fileType.toLowerCase() == 'application/pdf';
  }

  bool isImage(String fileType) {
    final imageTypes = ['png', 'jpg', 'jpeg', 'gif', 'bmp', 'webp'];
    return imageTypes.contains(fileType.toLowerCase());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.document.title),
      ),
      body: Center(
        child: _buildPreview(),
      ),
    );
  }

  Widget _buildPreview() {
    if (isPdf(widget.document.fileType)) {
      return SfPdfViewer.network(widget.document.fileUrl);
    } else if (isImage(widget.document.fileType)) {
      return Image.network(widget.document.fileUrl);
    } else if (isVideo(widget.document.fileType)) {
      if (_chewieController != null) {
        return Chewie(
          controller: _chewieController!,
        );
      } else {
        return const CircularProgressIndicator();
      }
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.warning,
            size: 50,
            color: Colors.red,
          ),
          const Text('Preview not available for this file type.'),
          const SizedBox(height: 20),
          GradientElevatedButton(
            onPressed: _launchUrl,
            child: const Text(
              'Open in another app',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
    }
  }
}
