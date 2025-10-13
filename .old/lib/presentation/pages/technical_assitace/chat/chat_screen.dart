import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fsm_flutter/presentation/core/components/gradient_appbar_widget.dart';
import 'package:socket_io_client/socket_io_client.dart' as socket;

import '../../../../core/constants.dart';

class LiveChatScreen extends StatefulWidget {
  const LiveChatScreen({super.key});

  @override
  LiveChatScreenState createState() => LiveChatScreenState();
}

class LiveChatScreenState extends State<LiveChatScreen> {
  late socket.Socket _socket;
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, dynamic>> _messages = [];
  final String _userName = "You";

  @override
  void initState() {
    super.initState();
    _socket = socket.io(AppConstants.baseUrl, <String, dynamic>{
      'transports': ['websocket'],
    });
    _socket.on('chat', (data) {
      setState(() {
        _messages.add(data);
      });
      _scrollToBottom();
    });
    _socket.on('file', (data) {
      setState(() {
        _messages.add(data);
      });
      _scrollToBottom();
    });
  }

  @override
  void dispose() {
    _socket.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      _socket.emit('chat', {'message': _controller.text, 'sender': _userName});

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
      final base64File = base64Encode(bytes);

      _socket.emit('file', {
        'sender': _userName,
        'file': base64File,
        'fileName': result.files.single.name,
        'fileType': result.files.single.extension,
      });
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
    debugPrint("Base64 file received:------------ $base64File");
    if (fileType == 'jpg' ||
        fileType == 'jpeg' ||
        fileType == 'png' ||
        fileType == 'gif') {
      try {
        final decodedBytes = base64Decode(base64File);
        if (decodedBytes.isEmpty) {
          debugPrint("Error: Empty image data.");
          return const SizedBox();
        }

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
                  decodedBytes,
                  width: 150,
                  height: 150,
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                fileName,
                style:
                    TextStyle(color: isSentByMe ? Colors.white : Colors.black),
              ),
              const SizedBox(height: 5),
            ],
          ),
        );
      } catch (e) {
        debugPrint("Error decoding base64 file:-------- $e");
        return const SizedBox();
      }
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: GradientAppBar(title: Text("Live Chat")),
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: Text(
                              isSentByMe ? 'You' : 'Sent by HelpDesk',
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
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(
                                message,
                                style: TextStyle(
                                  color:
                                      isSentByMe ? Colors.white : Colors.black,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
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
                        decoration:
                            const InputDecoration(hintText: 'Enter message'),
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
    );
  }
}
