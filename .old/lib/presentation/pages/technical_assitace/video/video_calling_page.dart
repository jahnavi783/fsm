import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

import '../../../core/components/custom_snackbar.dart';
import '../../../core/services/socket_io_client.dart';
import '../../../core/themes/app_theme.dart';
import '../components/drawing_painter.dart';

class VideoCallingPage extends StatefulWidget {
  final Map<String, dynamic>? extraInfo;
  const VideoCallingPage({super.key, this.extraInfo});

  @override
  State<VideoCallingPage> createState() => _VideoCallingPageState();
}

class _VideoCallingPageState extends State<VideoCallingPage> {
  ScreenshotController screenshotController = ScreenshotController();
  late WebRTCService _webrtcService;
  bool isCallOngoing = false;
  bool cameraFront = false;
  bool audioEnabled = true;
  bool showChat = false;
  bool flashLight = false;
  double zoomLevel = 1.0;
  List<Offset?> drawingPoints = [];
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, dynamic>> _messages = [];
  final String _userName = "You";

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft
    ]);
    _webrtcService = WebRTCService(
      noHelpDesk: _showNoHelpDeskSnackbar,
      onNewMessage: (message) {
        bool isDuplicate = _messages.any((msg) => msg['message'] == message);
        if (!isDuplicate) {
          setState(() {
            _messages.add({'message': message, 'sender': 'User'});
          });
          _scrollToBottom();
        } else {
          debugPrint("Duplicate message ignored: $message");
        }
      },
      onNewFile: (file, fileName, fileType, isSentByMe) {
        bool isDuplicate = _messages.any((msg) =>
            msg.containsKey('file') &&
            msg['fileName'] == fileName &&
            msg['fileType'] == fileType &&
            msg['sender'] == (isSentByMe ? 'HelpDesk' : 'User'));

        if (!isDuplicate) {
          setState(() {
            _messages.add({
              'file': file,
              'fileName': fileName,
              'fileType': fileType,
              'sender': isSentByMe ? 'HelpDesk' : 'User',
            });
          });
          _scrollToBottom();
        } else {
          debugPrint("Duplicate file message ignored: $fileName");
        }
      },
    );
    _webrtcService.createPeerConnectionFunction();
    _webrtcService.socket.on('drawing-data', _onReceiveDrawingData);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    setState(() {});
  }

  @override
  void dispose() {
    _webrtcService.socket.off('drawing-data');
    _webrtcService.close();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  void _startCall() async {
    await _webrtcService.createOffer(extraInfo: widget.extraInfo);
    setState(() {
      isCallOngoing = true;
    });
  }

  void _hangUp() async {
    setState(() {
      isCallOngoing = false;
    });
    await _webrtcService.reset();
  }

  void _onDraw(Offset position) {
    setState(() {
      drawingPoints.add(position);
    });
    _webrtcService.socket.emit('drawing-data', {
      'x': position.dx,
      'y': position.dy,
    });
  }

  void _onClear() {
    setState(() {
      drawingPoints.clear();
    });
    _webrtcService.socket.emit('clear-drawing');
  }

  void _onReceiveDrawingData(dynamic data) {
    setState(() {
      drawingPoints = List<Offset?>.from(
          data['points'].map((point) => Offset(point[0], point[1])));
    });
  }

  void _onZoomChanged(double value) async {
    setState(() {
      zoomLevel = value;
    });
    _webrtcService.setZoom(zoomLevel);
  }

  void _showNoHelpDeskSnackbar(String message) {
    showCustomSnackbar(context, message);
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      _webrtcService.sendMessage(_controller.text);

      setState(() {
        _messages.add({'message': _controller.text, 'sender': _userName});
      });

      _controller.clear();
      _scrollToBottom();
    }
  }

  Future<void> _sendFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.any, withData: true);

    if (result != null) {
      final bytes = result.files.single.bytes!;
      _webrtcService.sendFile(result.files.single.name,
          result.files.single.extension ?? 'unknown', bytes);
    }
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent + 300,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  Widget _getFilePreview(
      String fileType, String fileName, String base64File, bool isSentByMe) {
    if (fileType == 'jpg' ||
        fileType == 'jpeg' ||
        fileType == 'png' ||
        fileType == 'gif') {
      return Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        color: isSentByMe ? Colors.blue.shade300 : Colors.grey[300],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              margin: const EdgeInsets.all(5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.memory(
                base64Decode(base64File),
                width: 150,
                height: 150,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              fileName,
              style: TextStyle(color: isSentByMe ? Colors.white : Colors.black),
            ),
            const SizedBox(height: 5),
          ],
        ),
      );
    } else if (fileType == 'pdf') {
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'PDF File: $fileName',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text('File Type: PDF'),
            ],
          ),
        ),
      );
    } else {
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('File: $fileName'),
        ),
      );
    }
  }

  void _captureScreenShot() async {
    if (Platform.isAndroid) {
      if (await Permission.manageExternalStorage.isGranted) {
        _captureAndSaveScreenshot();
      } else {
        if (await Permission.manageExternalStorage.request().isGranted) {
          _captureAndSaveScreenshot();
        } else {
          showCustomSnackbar(
              context, "Permission to access storage is denied.");
        }
      }
    } else {
      if (await Permission.storage.request().isGranted) {
        _captureAndSaveScreenshot();
      } else {
        showCustomSnackbar(context, "Permission to access storage is denied.");
      }
    }
  }

  void _captureAndSaveScreenshot() async {
    screenshotController.capture().then((Uint8List? image) async {
      if (image != null) {
        final downloadDir = Directory('/storage/emulated/0/Download');
        if (!await downloadDir.exists()) {
          await downloadDir.create(recursive: true);
        }

        final filePath =
            '${downloadDir.path}/screenshot_${DateTime.now().millisecondsSinceEpoch}.png';
        final file = File(filePath);

        await file.writeAsBytes(image);

        showCustomSnackbar(context, "Screenshot saved to download folder.",
            color: Colors.green);
      }
    }).catchError((onError) {
      showCustomSnackbar(context, onError.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: screenshotController,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.blackColor,
          body: OrientationBuilder(builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              return Container(
                padding: EdgeInsets.all((10)),
                color: AppColors.lightPrimaryColor,
                child: Center(
                  child: Text(
                    "Please rotate your device to better experience",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: (20)),
                  ),
                ),
              );
            } else {
              return Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular((15)),
                          child: RTCVideoView(
                            _webrtcService.localRenderer,
                            objectFit: RTCVideoViewObjectFit
                                .RTCVideoViewObjectFitCover,
                          ),
                        ),
                        Positioned.fill(
                          child: DrawingCanvas(
                            onDraw: _onDraw,
                            onClear: _onClear,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: InkWell(
                            onTap: _captureScreenShot,
                            child: Card(
                              margin: EdgeInsets.all((6)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all((6)),
                                child: Icon(
                                  Icons.screenshot_monitor_outlined,
                                  color: AppColors.blackColor,
                                  size: (12),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    showChat = !showChat;
                                  });
                                },
                                child: Card(
                                  margin: EdgeInsets.all((6)),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all((6)),
                                    child: Icon(
                                      showChat
                                          ? Icons.speaker_notes_off_outlined
                                          : Icons.speaker_notes_outlined,
                                      color: AppColors.blackColor,
                                      size: (12),
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: SizedBox(
                                  height: (130),
                                  width: (25),
                                  child: RotatedBox(
                                    quarterTurns: 3,
                                    child: Slider(
                                      value: zoomLevel,
                                      min: 1.0,
                                      max: 1.75,
                                      onChanged: _onZoomChanged,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  _webrtcService.toggleCamera();
                                  setState(() {
                                    cameraFront = !cameraFront;
                                  });
                                },
                                child: Card(
                                  margin: EdgeInsets.all((6)),
                                  color: AppColors.errorColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all((6)),
                                    child: Icon(
                                      cameraFront
                                          ? Icons.video_camera_front_outlined
                                          : Icons.video_camera_back_outlined,
                                      color: AppColors.whiteColor,
                                      size: (12),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: isCallOngoing ? _hangUp : _startCall,
                                child: Card(
                                  margin: EdgeInsets.all((4)),
                                  color: isCallOngoing
                                      ? AppColors.errorColor
                                      : AppColors.greenColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: (12),
                                        vertical: (6)),
                                    child: Icon(
                                      isCallOngoing
                                          ? Icons.call_outlined
                                          : Icons.call_end_outlined,
                                      color: AppColors.whiteColor,
                                      size: (14),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  _webrtcService.toggleMic();
                                  setState(() {
                                    audioEnabled = !audioEnabled;
                                  });
                                },
                                child: Card(
                                  margin: EdgeInsets.all((6)),
                                  color: audioEnabled
                                      ? AppColors.greenColor
                                      : AppColors.errorColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all((6)),
                                    child: Icon(
                                      audioEnabled
                                          ? Icons.mic_outlined
                                          : Icons.mic_off_outlined,
                                      color: AppColors.whiteColor,
                                      size: (12),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: showChat,
                    child: Expanded(
                      flex: 2,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text("Live Chat",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            Expanded(
                              child: ListView.builder(
                                controller: _scrollController,
                                itemCount: _messages.length,
                                itemBuilder: (context, index) {
                                  final messageData = _messages[index];
                                  final message = messageData['message'];
                                  final sender = messageData['sender'];
                                  final isSentByMe = sender == _userName;

                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0, horizontal: 8.0),
                                    child: Column(
                                      crossAxisAlignment: isSentByMe
                                          ? CrossAxisAlignment.end
                                          : CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 5.0),
                                          child: Text(
                                            isSentByMe
                                                ? 'You'
                                                : 'Sent by HelpDesk',
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                        ),
                                        if (messageData.containsKey('file'))
                                          _getFilePreview(
                                            messageData['fileType'],
                                            messageData['fileName'],
                                            messageData['file'],
                                            isSentByMe,
                                          )
                                        else
                                          Container(
                                            decoration: BoxDecoration(
                                              color: isSentByMe
                                                  ? Colors.blue.shade300
                                                  : Colors.grey[300],
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                            child: Text(
                                              message,
                                              style: TextStyle(
                                                color: isSentByMe
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.attach_file),
                                    onPressed: _sendFile,
                                  ),
                                  Expanded(
                                    child: TextField(
                                      controller: _controller,
                                      textInputAction: TextInputAction.go,
                                      onSubmitted: (value) {
                                        _sendMessage();
                                      },
                                      decoration: const InputDecoration(
                                          hintText: 'Enter message'),
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.send),
                                    onPressed: _sendMessage,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              );
            }
          }),
        ),
      ),
    );
  }
}
