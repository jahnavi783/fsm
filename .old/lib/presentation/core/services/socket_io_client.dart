import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class WebRTCService {
  late RTCPeerConnection _peerConnection;
  late MediaStream _localStream;
  late io.Socket socket;

  final RTCVideoRenderer _localRenderer = RTCVideoRenderer();
  final RTCVideoRenderer _remoteRenderer = RTCVideoRenderer();
  final Function(String data) noHelpDesk;
  final Function(String message) onNewMessage;
  final Function(String file, String fileName, String fileType, bool isSentByMe)
      onNewFile;
  bool isConnected = false;

  WebRTCService({
    required this.noHelpDesk,
    required this.onNewMessage,
    required this.onNewFile,
  }) {
    _localRenderer.initialize();
    _remoteRenderer.initialize();
    _initializeSocket();
  }

  void _initializeSocket() {
    socket = io.io('http://172.16.116.171:3000', <String, dynamic>{
      'transports': ['websocket'],
      'query': {'role': 'user'},
    });

    socket.on('offer', _onOffer);
    socket.on('answer', _onAnswer);
    socket.on('ice-candidate', _onIceCandidate);
    socket.on('no-helpdesk', _onNoHelpDeskUsers);
    socket.on('chat', _onChatMessage);
    socket.on('file', _onFileMessage);
  }

  Future<void> _getUserMedia({bool useBackCamera = true}) async {
    final mediaConstraints = {
      'audio': false,
      'video': {
        'mandatory': {
          'minFrameRate': '30',
        },
        'optional': [],
      }
    };

    if (useBackCamera) {
      mediaConstraints['video'] = {
        'facingMode': 'environment',
        'mandatory': {
          'minFrameRate': '30',
        },
        'optional': [],
      };
    } else {
      mediaConstraints['video'] = {
        'facingMode': 'user',
        'mandatory': {
          'minFrameRate': '30',
        },
        'optional': [],
      };
    }

    try {
      _localStream =
          await navigator.mediaDevices.getUserMedia(mediaConstraints);
      _localRenderer.srcObject = _localStream;
    } catch (e) {
      debugPrint('Error getting user media: $e');
    }
  }

  Future<void> createPeerConnectionFunction() async {
    await _getUserMedia(useBackCamera: true);

    final configuration = {
      'iceServers': [
        {'urls': 'stun:stun.l.google.com:19302'},
      ],
      'sdpSemantics': 'plan-b',
    };

    _peerConnection = await createPeerConnection(configuration);

    _localStream.getTracks().forEach((track) {
      _peerConnection.addTrack(track, _localStream);
    });

    _peerConnection.onIceCandidate = (candidate) {
      socket.emit('ice-candidate', candidate.toMap());
    };

    _peerConnection.onTrack = (RTCTrackEvent event) {
      if (event.streams.isNotEmpty) {
        _remoteRenderer.srcObject = event.streams[0];
      }
    };
  }

  Future<void> createOffer({Map<String, dynamic>? extraInfo}) async {
    final offer = await _peerConnection.createOffer();
    await _peerConnection.setLocalDescription(offer);

    final offerData = {
      'sdp': offer.sdp,
      'type': offer.type,
      'extraInfo': extraInfo ?? {},
    };

    socket.emit('offer', offerData);
  }

  void _onOffer(data) async {
    final offer = RTCSessionDescription(data['sdp'], data['type']);
    await _peerConnection.setRemoteDescription(offer);

    final answer = await _peerConnection.createAnswer();
    await _peerConnection.setLocalDescription(answer);
    socket.emit('answer', answer.toMap());
  }

  void _onAnswer(data) async {
    final answer = RTCSessionDescription(data['sdp'], data['type']);
    await _peerConnection.setRemoteDescription(answer);
    isConnected = true;
  }

  void _onIceCandidate(data) {
    final candidate = RTCIceCandidate(
        data['candidate'], data['sdpMid'], data['sdpMLineIndex']);
    _peerConnection.addCandidate(candidate);
  }

  void _onNoHelpDeskUsers(data) {
    noHelpDesk(data['message']);
  }

  void _onChatMessage(dynamic data) {
    final String message = data['message'];
    onNewMessage(message);
  }

  void _onFileMessage(dynamic data) {
    final String base64File = data['file'];
    final String fileName = data['fileName'];
    final String fileType = data['fileType'];
    final bool isSentByMe = data['sender'] == "You";
    onNewFile(base64File, fileName, fileType, isSentByMe);
  }

  void sendMessage(String message) {
    socket.emit('chat', {'message': message, 'sender': 'You'});
  }

  Future<void> sendFile(
      String fileName, String fileType, List<int> bytes) async {
    final base64File = base64Encode(bytes);
    socket.emit('file', {
      'sender': 'You',
      'file': base64File,
      'fileName': fileName,
      'fileType': fileType,
    });
  }

  Future<void> reset() async {
    await _peerConnection.close();
    await _localStream.dispose();
    _localRenderer.srcObject = null;
    _initializeSocket();
    _localRenderer.initialize();
    _remoteRenderer.initialize();
    await createPeerConnectionFunction();
  }

  Future<void> close() async {
    await _peerConnection.close();
    await _localStream.dispose();
    socket.dispose();
  }

  RTCVideoRenderer get localRenderer => _localRenderer;
  RTCVideoRenderer get remoteRenderer => _remoteRenderer;

  void setZoom(double zoomLevel) async {
    try {
      MediaStreamTrack videoTrack = _localStream
          .getVideoTracks()
          .firstWhere((track) => track.kind == 'video');

      final result = await WebRTC.invokeMethod('mediaStreamTrackSetZoom', {
        'trackId': videoTrack.id,
        'zoomLevel': zoomLevel,
      });

      if (result == null) {
        debugPrint("Zoom applied successfully.");
      } else {
        debugPrint("Error: $result");
      }
    } catch (e) {
      debugPrint("Error applying zoom: $e");
    }
  }

  void toggleCamera() async {
    final videoTrack = _localStream
        .getVideoTracks()
        .firstWhere((track) => track.kind == 'video');
    await Helper.switchCamera(videoTrack);
  }

  void toggleMic() async {
    final audioTrack = _localStream
        .getAudioTracks()
        .firstWhere((track) => track.kind == 'audio');
    await WebRTC.invokeMethod('mediaStreamTrackToggleMute',
        <String, dynamic>{'trackId': audioTrack.id});
  }
}
