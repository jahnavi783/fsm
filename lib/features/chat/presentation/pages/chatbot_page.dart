// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
// import 'package:flutter_chat_ui/flutter_chat_ui.dart';
// import 'package:uuid/uuid.dart';
//
// import '../../../../core/./services/chatbot_services.dart';
// import '../../../auth/presentation/blocs/auth/auth_bloc.dart';
//
// @RoutePage()
// class ChatbotPage extends StatefulWidget {
//   const ChatbotPage({super.key});
//
//   @override
//   State<ChatbotPage> createState() => _ChatbotPageState();
// }
//
// class _ChatbotPageState extends State<ChatbotPage> {
//   // UI state variables
//   final List<types.Message> _messages = [];
//   final TextEditingController _textCtrl = TextEditingController();
//   final _user = const types.User(id: 'user-1', firstName: 'You');
//   final _bot = const types.User(id: 'bot-1', firstName: 'FSM Agent');
//
//   bool _isBotTyping = false;
//   bool _inputEnabled = false;
//
//   // API service variables
//   late ChatbotApiService _apiService;
//   String? _sessionId;
//   String? _errorMessage;
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeChat();
//   }
//
//   @override
//   void dispose() {
//     _textCtrl.dispose();
//     // End session when leaving page
//     if (_sessionId != null) {
//       _apiService.endSession(_sessionId!);
//     }
//     _apiService.dispose();
//     super.dispose();
//   }
//
//   /// STEP 1: Initialize chat when page opens
//   void _initializeChat() async {
//     // final authToken = BlocProvider.of<AuthBloc>(context).state.accessToken;
//     final authState = BlocProvider.of<AuthBloc>(context).state;
//
//     String? authToken;
//     if (authState is Authenticated) {
//       authToken = authState.user.accessToken;
//     }
//
//     // Create API service
//     _apiService = ChatbotApiService(token: authToken);
//
//     // Start session
//     await _startSession();
//   }
//
//   /// STEP 2: Start a new chat session
//   Future<void> _startSession() async {
//     try {
//       setState(() {
//         _isBotTyping = true;
//         _errorMessage = null;
//       });
//
//       // Call API to start session
//       final response = await _apiService.startSession();
//
//       setState(() {
//         _sessionId = response.sessionId;
//         _inputEnabled = true;
//         _isBotTyping = false;
//       });
//
//       // Show welcome message
//       _addInitialBotMessage();
//
//       // Show success notification
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Chat session started'),
//             duration: Duration(seconds: 2),
//           ),
//         );
//       }
//     } catch (e) {
//       setState(() {
//         _isBotTyping = false;
//         _errorMessage = e.toString();
//       });
//
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(' Error: $e'),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     }
//   }
//
//   /// Add initial bot message
//   void _addInitialBotMessage() {
//     final message = types.TextMessage(
//       author: _bot,
//       id: const Uuid().v4(),
//       text:
//           "Hi! I'm FSM Agent, your assistant for Field Service Management. How can I help you today?",
//       createdAt: DateTime.now().millisecondsSinceEpoch,
//     );
//
//     setState(() {
//       _messages.insert(0, message);
//     });
//   }
//
//   /// STEP 3: Send user's message to bot
//   void _handleSendPressed(types.PartialText message) async {
//     if (!_inputEnabled || _sessionId == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('⚠️ Please wait, session starting...')),
//       );
//       return;
//     }
//
//     // Create user message and add to UI
//     final userMessage = types.TextMessage(
//       author: _user,
//       id: const Uuid().v4(),
//       text: message.text,
//       createdAt: DateTime.now().millisecondsSinceEpoch,
//     );
//
//     setState(() {
//       _messages.insert(0, userMessage);
//       _isBotTyping = true;
//       _messages.insert(0, _buildTypingPlaceholder());
//       _inputEnabled = false;
//     });
//
//     try {
//       // Call API to send message
//       final response = await _apiService.sendMessage(
//         sessionId: _sessionId!,
//         message: message.text,
//       );
//
//       // Create bot reply and add to UI
//       final botReply = types.TextMessage(
//         author: _bot,
//         id: const Uuid().v4(),
//         text: response.message,
//         createdAt: DateTime.now().millisecondsSinceEpoch,
//       );
//
//       setState(() {
//         _isBotTyping = false;
//         _inputEnabled = true;
//         _messages.removeWhere((m) => m.id == '__typing__');
//         _messages.insert(0, botReply);
//       });
//
//       // Log tools used
//       if (response.toolsUsed != null && response.toolsUsed!.isNotEmpty) {
//         debugPrint('🔧 Tools used: ${response.toolsUsed!.join(", ")}');
//       }
//     } catch (e) {
//       setState(() {
//         _isBotTyping = false;
//         _inputEnabled = true;
//         _messages.removeWhere((m) => m.id == '__typing__');
//       });
//
//       // Show error as bot message
//       final errorMessage = types.TextMessage(
//         author: _bot,
//         id: const Uuid().v4(),
//         text: '❌ Sorry, I encountered an error: $e',
//         createdAt: DateTime.now().millisecondsSinceEpoch,
//       );
//
//       setState(() {
//         _messages.insert(0, errorMessage);
//       });
//     }
//   }
//
//   /// Build typing indicator placeholder
//   types.TextMessage _buildTypingPlaceholder() {
//     return types.TextMessage(
//       author: _bot,
//       id: '__typing__',
//       text: 'typing...',
//       createdAt: DateTime.now().millisecondsSinceEpoch,
//     );
//   }
//
//   /// Clear chat and restart session
//   void _clearChat() async {
//     if (_sessionId != null) {
//       try {
//         await _apiService.endSession(_sessionId!);
//       } catch (e) {
//         debugPrint('Error ending session: $e');
//       }
//     }
//
//     setState(() {
//       _messages.clear();
//       _sessionId = null;
//       _isBotTyping = false;
//       _inputEnabled = false;
//     });
//
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('🔄 Starting new session...')),
//     );
//
//     await _startSession();
//   }
//
//   /// Send message when user presses enter or send button
//   void _trySend() {
//     final text = _textCtrl.text.trim();
//     if (text.isEmpty) return;
//     _textCtrl.clear();
//     _handleSendPressed(types.PartialText(text: text));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           children: const [
//             Icon(Icons.smart_toy, color: Colors.white),
//             SizedBox(width: 8),
//             Text('AI Assistant'),
//           ],
//         ),
//         actions: [
//           IconButton(
//             tooltip: 'Clear chat',
//             icon: const Icon(Icons.delete_outline),
//             onPressed: _messages.isEmpty ? null : _clearChat,
//           ),
//         ],
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Color(0xFF00796B), Color(0xFF004D40)],
//             ),
//           ),
//         ),
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Error banner
//             if (_errorMessage != null)
//               Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.all(12),
//                 color: Colors.red.shade100,
//                 child: Row(
//                   children: [
//                     const Icon(Icons.error_outline, color: Colors.red),
//                     const SizedBox(width: 8),
//                     Expanded(
//                       child: Text(_errorMessage!,
//                           style: const TextStyle(color: Colors.red)),
//                     ),
//                     IconButton(
//                       icon: const Icon(Icons.close, color: Colors.red),
//                       onPressed: () => setState(() => _errorMessage = null),
//                     ),
//                   ],
//                 ),
//               ),
//
//             // Chat messages
//             Expanded(
//               child: Chat(
//                 messages: _messages,
//                 user: _user,
//                 onSendPressed: (_) {},
//                 scrollPhysics: const BouncingScrollPhysics(),
//                 bubbleBuilder: (child,
//                     {required message, required nextMessageInGroup}) {
//                   final isUser = message.author.id == _user.id;
//                   final isTyping = message.id == '__typing__';
//
//                   if (isTyping) {
//                     return Align(
//                       alignment: Alignment.centerLeft,
//                       child: Container(
//                         margin: const EdgeInsets.all(8),
//                         padding: const EdgeInsets.all(10),
//                         decoration: BoxDecoration(
//                           color: const Color(0xFFE5F4F1),
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                         child: const _TypingDots(),
//                       ),
//                     );
//                   }
//
//                   return Align(
//                     alignment:
//                         isUser ? Alignment.centerRight : Alignment.centerLeft,
//                     child: Container(
//                       margin: const EdgeInsets.symmetric(
//                           vertical: 4, horizontal: 12),
//                       padding: const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: isUser
//                             ? const Color(0xFF00796B)
//                             : const Color(0xFFE5F4F1),
//                         borderRadius: BorderRadius.circular(16),
//                       ),
//                       child: Text(
//                         (message as types.TextMessage).text,
//                         style: TextStyle(
//                           color: isUser ? Colors.white : Colors.black87,
//                           fontSize: 15,
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//                 showUserAvatars: false,
//                 showUserNames: false,
//                 theme: const DefaultChatTheme(
//                   primaryColor: Color(0xFF00796B),
//                 ),
//                 customBottomWidget: const SizedBox.shrink(),
//               ),
//             ),
//
//             // Text input
//             Container(
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: Colors.grey.shade100,
//                 border: Border(top: BorderSide(color: Colors.grey.shade300)),
//               ),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       controller: _textCtrl,
//                       enabled: _inputEnabled,
//                       maxLines: null,
//                       decoration: InputDecoration(
//                         hintText: _sessionId == null
//                             ? 'Starting session...'
//                             : 'Type a message...',
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(24)),
//                         contentPadding: const EdgeInsets.symmetric(
//                             horizontal: 16, vertical: 10),
//                       ),
//                       onSubmitted: (_) => _trySend(),
//                     ),
//                   ),
//                   const SizedBox(width: 8),
//                   CircleAvatar(
//                     backgroundColor: const Color(0xFF00796B),
//                     child: IconButton(
//                       icon: const Icon(Icons.send, color: Colors.white),
//                       onPressed: _inputEnabled ? _trySend : null,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// /// Typing animation widget
// class _TypingDots extends StatefulWidget {
//   const _TypingDots();
//
//   @override
//   State<_TypingDots> createState() => _TypingDotsState();
// }
//
// class _TypingDotsState extends State<_TypingDots>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1000),
//     )..repeat();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: List.generate(3, (index) {
//         return AnimatedBuilder(
//           animation: _controller,
//           builder: (_, __) {
//             double t = (_controller.value + (index * 0.2)) % 1.0;
//             double opacity = t < 0.5 ? 1.0 - (t * 2) : (t - 0.5) * 2;
//             return Opacity(
//               opacity: opacity,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 2),
//                 child: Container(
//                   width: 6,
//                   height: 6,
//                   decoration: const BoxDecoration(
//                     color: Color(0xFF00796B),
//                     shape: BoxShape.circle,
//                   ),
//                 ),
//               ),
//             );
//           },
//         );
//       }),
//     );
//   }
// }
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/services/chatbot_services.dart';
import '../../../auth/presentation/blocs/auth/auth_bloc.dart';
import '../../../auth/presentation/blocs/auth/auth_state.dart';

@RoutePage()
class ChatbotPage extends StatefulWidget {
  const ChatbotPage({super.key});

  @override
  State<ChatbotPage> createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  // UI State
  final List<types.Message> _messages = [];
  final TextEditingController _inputCtrl = TextEditingController();
  final _user = const types.User(id: 'user-1', firstName: 'You');
  final _bot = const types.User(id: 'bot-1', firstName: 'FSM Bot');

  bool _inputEnabled = false;
  bool _botTyping = false;

  // API
  ChatbotApiService? _api;
  String? _sessionId;
  String? _error;

  @override
  void initState() {
    super.initState();
    _bootstrap();
  }

  @override
  void dispose() {
    _inputCtrl.dispose();
    if (_sessionId != null) _api?.endSession(_sessionId!);
    _api?.dispose();
    super.dispose();
  }

  // ---------------------------------------------------------------------------
  // INIT WORKFLOW
  // ---------------------------------------------------------------------------

  Future<void> _bootstrap() async {
    final authState = BlocProvider.of<AuthBloc>(context).state;

    // Extract access token safely using maybeWhen
    final token = authState.maybeWhen(
      authenticated: (user) => user.accessToken,
      orElse: () => null,
    );

    if (token == null) {
      setState(() => _error = "Authentication expired. Please log in again.");
      return;
    }

    _api = ChatbotApiService(token: token);
    await _startSession();
  }

  Future<void> _startSession() async {
    try {
      setState(() {
        _botTyping = true;
        _error = null;
      });

      final res = await _api!.startSession();

      setState(() {
        _sessionId = res.sessionId;
        _inputEnabled = true;
        _botTyping = false;
      });

      _addWelcomeMessage();

      if (!mounted) return;
    } catch (e) {
      setState(() {
        _error = e.toString();
        _botTyping = false;
      });
    }
  }

  void _addWelcomeMessage() {
    final msg = types.TextMessage(
      id: const Uuid().v4(),
      author: _bot,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      text: "Hello! I'm your FSM assistant. How can I help you today?",
    );

    setState(() => _messages.insert(0, msg));
  }

  // ---------------------------------------------------------------------------
  // MESSAGE FLOW
  // ---------------------------------------------------------------------------

  Future<void> _sendUserMessage(String text) async {
    if (_sessionId == null || !_inputEnabled) return;

    // Insert user message
    final userMsg = types.TextMessage(
      id: const Uuid().v4(),
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      text: text,
    );

    setState(() {
      _messages.insert(0, userMsg);
      _botTyping = true;
      _messages.insert(0, _buildTypingPlaceholder());
      _inputEnabled = false;
    });

    try {
      final response = await _api!.sendMessage(
        sessionId: _sessionId!,
        message: text,
      );

      final botMsg = types.TextMessage(
        id: const Uuid().v4(),
        author: _bot,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        text: response.message,
      );

      setState(() {
        _botTyping = false;
        _inputEnabled = true;
        _messages.removeWhere((m) => m.id == "__typing__");
        _messages.insert(0, botMsg);
      });
    } catch (e) {
      setState(() {
        _botTyping = false;
        _inputEnabled = true;
        _messages.removeWhere((m) => m.id == "__typing__");
      });

      final errMsg = types.TextMessage(
        id: const Uuid().v4(),
        author: _bot,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        text: "Error: $e",
      );

      setState(() => _messages.insert(0, errMsg));
    }
  }

  types.TextMessage _buildTypingPlaceholder() {
    return types.TextMessage(
      id: "__typing__",
      author: _bot,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      text: "typing...",
    );
  }

  // ---------------------------------------------------------------------------
  // CHAT RESET
  // ---------------------------------------------------------------------------

  Future<void> _resetChat() async {
    if (_sessionId != null) {
      try {
        await _api?.endSession(_sessionId!);
      } catch (_) {}
    }

    setState(() {
      _messages.clear();
      _sessionId = null;
      _inputEnabled = false;
      _botTyping = false;
    });

    await _startSession();
  }

  // ---------------------------------------------------------------------------
  // UI
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildHeader(),
      body: Column(
        children: [
          if (_error != null) _buildErrorBanner(),
          Expanded(child: _buildChat()),
          _buildInputBar(),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildHeader() {
    return AppBar(
      title: const Text("AI Assistant"),
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: _messages.isEmpty ? null : _resetChat,
        ),
      ],
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF00796B), Color(0xFF004D40)],
          ),
        ),
      ),
    );
  }

  Widget _buildErrorBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      color: Colors.red.shade100,
      child: Text(
        _error!,
        style: const TextStyle(color: Colors.red),
      ),
    );
  }

  Widget _buildChat() {
    return Chat(
      messages: _messages,
      user: _user,
      onSendPressed: (_) {},
      customBottomWidget: const SizedBox.shrink(),
      showUserNames: false,
      showUserAvatars: false,
      bubbleBuilder: (child, {required message, required nextMessageInGroup}) {
        return _buildMessageBubble(message);
      },
    );
  }

  Widget _buildMessageBubble(types.Message msg) {
    final isUser = msg.author.id == _user.id;
    final isTyping = msg.id == "__typing__";

    if (isTyping) {
      return const Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Text("Agent is typing..."),
        ),
      );
    }

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isUser ? const Color(0xFF00796B) : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          (msg as types.TextMessage).text,
          style: TextStyle(
            color: isUser ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }

  Widget _buildInputBar() {
    return Container(
      padding: const EdgeInsets.all(12),
      color: Colors.grey.shade100,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _inputCtrl,
              enabled: _inputEnabled,
              decoration: const InputDecoration(
                hintText: "Type your message...",
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) => _submitMessage(),
            ),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            backgroundColor: const Color(0xFF00796B),
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.white),
              onPressed: _inputEnabled ? _submitMessage : null,
            ),
          ),
        ],
      ),
    );
  }

  void _submitMessage() {
    final text = _inputCtrl.text.trim();
    if (text.isEmpty) return;

    _inputCtrl.clear();
    _sendUserMessage(text);
  }
}
