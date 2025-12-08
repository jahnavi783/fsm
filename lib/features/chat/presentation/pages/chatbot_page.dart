// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
// import 'package:flutter_chat_ui/flutter_chat_ui.dart';
// import 'package:uuid/uuid.dart';
//
// import '../../../../core/services/chatbot_services.dart';
// import '../../../auth/presentation/blocs/auth/auth_bloc.dart';
// import '../../../auth/presentation/blocs/auth/auth_state.dart';
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
//   // UI State
//   final List<types.Message> _messages = [];
//   final TextEditingController _inputCtrl = TextEditingController();
//   final _user = const types.User(id: 'user-1', firstName: 'You');
//   final _bot = const types.User(id: 'bot-1', firstName: 'FSM Bot');
//
//   bool _inputEnabled = false;
//   bool _botTyping = false;
//
//   // API
//   ChatbotApiService? _api;
//   String? _sessionId;
//   String? _error;
//
//   @override
//   void initState() {
//     super.initState();
//     _bootstrap();
//   }
//
//   @override
//   void dispose() {
//     _inputCtrl.dispose();
//     if (_sessionId != null) _api?.endSession(_sessionId!);
//     _api?.dispose();
//     super.dispose();
//   }
//
//   // ---------------------------------------------------------------------------
//   // INIT WORKFLOW
//   // ---------------------------------------------------------------------------
//
//   Future<void> _bootstrap() async {
//     final authState = BlocProvider.of<AuthBloc>(context).state;
//
//     // Extract access token safely using maybeWhen
//     final token = authState.maybeWhen(
//       authenticated: (user) => user.accessToken,
//       orElse: () => null,
//     );
//
//     if (token == null) {
//       setState(() => _error = "Authentication expired. Please log in again.");
//       return;
//     }
//
//     _api = ChatbotApiService(token: token);
//     await _startSession();
//   }
//
//   Future<void> _startSession() async {
//     try {
//       setState(() {
//         _botTyping = true;
//         _error = null;
//       });
//
//       final res = await _api!.startSession();
//
//       setState(() {
//         _sessionId = res.sessionId;
//         _inputEnabled = true;
//         _botTyping = false;
//       });
//
//       _addWelcomeMessage();
//
//       if (!mounted) return;
//     } catch (e) {
//       setState(() {
//         _error = e.toString();
//         _botTyping = false;
//       });
//     }
//   }
//
//   void _addWelcomeMessage() {
//     final msg = types.TextMessage(
//       id: const Uuid().v4(),
//       author: _bot,
//       createdAt: DateTime.now().millisecondsSinceEpoch,
//       text: "Hello! I'm your FSM assistant. How can I help you today?",
//     );
//
//     setState(() => _messages.insert(0, msg));
//   }
//
//   // ---------------------------------------------------------------------------
//   // MESSAGE FLOW
//   // ---------------------------------------------------------------------------
//
//   Future<void> _sendUserMessage(String text) async {
//     if (_sessionId == null || !_inputEnabled) return;
//
//     // Insert user message
//     final userMsg = types.TextMessage(
//       id: const Uuid().v4(),
//       author: _user,
//       createdAt: DateTime.now().millisecondsSinceEpoch,
//       text: text,
//     );
//
//     setState(() {
//       _messages.insert(0, userMsg);
//       _botTyping = true;
//       _messages.insert(0, _buildTypingPlaceholder());
//       _inputEnabled = false;
//     });
//
//     try {
//       final response = await _api!.sendMessage(
//         sessionId: _sessionId!,
//         message: text,
//       );
//
//       final botMsg = types.TextMessage(
//         id: const Uuid().v4(),
//         author: _bot,
//         createdAt: DateTime.now().millisecondsSinceEpoch,
//         text: response.message,
//       );
//
//       setState(() {
//         _botTyping = false;
//         _inputEnabled = true;
//         _messages.removeWhere((m) => m.id == "__typing__");
//         _messages.insert(0, botMsg);
//       });
//     } catch (e) {
//       setState(() {
//         _botTyping = false;
//         _inputEnabled = true;
//         _messages.removeWhere((m) => m.id == "__typing__");
//       });
//
//       final errMsg = types.TextMessage(
//         id: const Uuid().v4(),
//         author: _bot,
//         createdAt: DateTime.now().millisecondsSinceEpoch,
//         text: "Error: $e",
//       );
//
//       setState(() => _messages.insert(0, errMsg));
//     }
//   }
//
//   types.TextMessage _buildTypingPlaceholder() {
//     return types.TextMessage(
//       id: "__typing__",
//       author: _bot,
//       createdAt: DateTime.now().millisecondsSinceEpoch,
//       text: "typing...",
//     );
//   }
//
//   // ---------------------------------------------------------------------------
//   // CHAT RESET
//   // ---------------------------------------------------------------------------
//
//   Future<void> _resetChat() async {
//     if (_sessionId != null) {
//       try {
//         await _api?.endSession(_sessionId!);
//       } catch (_) {}
//     }
//
//     setState(() {
//       _messages.clear();
//       _sessionId = null;
//       _inputEnabled = false;
//       _botTyping = false;
//     });
//
//     await _startSession();
//   }
//
//   // ---------------------------------------------------------------------------
//   // UI
//   // ---------------------------------------------------------------------------
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _buildHeader(),
//       body: Column(
//         children: [
//           if (_error != null) _buildErrorBanner(),
//           Expanded(child: _buildChat()),
//           _buildInputBar(),
//         ],
//       ),
//     );
//   }
//
//   PreferredSizeWidget _buildHeader() {
//     return AppBar(
//       title: const Text("AI Assistant"),
//       actions: [
//         IconButton(
//           icon: const Icon(Icons.refresh),
//           onPressed: _messages.isEmpty ? null : _resetChat,
//         ),
//       ],
//       flexibleSpace: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFF00796B), Color(0xFF004D40)],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildErrorBanner() {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(12),
//       color: Colors.red.shade100,
//       child: Text(
//         _error!,
//         style: const TextStyle(color: Colors.red),
//       ),
//     );
//   }
//
//   Widget _buildChat() {
//     return Chat(
//       messages: _messages,
//       user: _user,
//       onSendPressed: (_) {},
//       customBottomWidget: const SizedBox.shrink(),
//       showUserNames: false,
//       showUserAvatars: false,
//       bubbleBuilder: (child, {required message, required nextMessageInGroup}) {
//         return _buildMessageBubble(message);
//       },
//     );
//   }
//
//   Widget _buildMessageBubble(types.Message msg) {
//     final isUser = msg.author.id == _user.id;
//     final isTyping = msg.id == "__typing__";
//
//     if (isTyping) {
//       return const Align(
//         alignment: Alignment.centerLeft,
//         child: Padding(
//           padding: EdgeInsets.all(8),
//           child: Text("FSM is typing..."),
//         ),
//       );
//     }
//
//     return Align(
//       alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
//         padding: const EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: isUser ? const Color(0xFF00796B) : Colors.grey.shade200,
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: Text(
//           (msg as types.TextMessage).text,
//           style: TextStyle(
//             color: isUser ? Colors.white : Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildInputBar() {
//     return Container(
//       padding: const EdgeInsets.all(12),
//       color: Colors.grey.shade100,
//       child: Row(
//         children: [
//           Expanded(
//             child: TextField(
//               controller: _inputCtrl,
//               enabled: _inputEnabled,
//               decoration: const InputDecoration(
//                 hintText: "Type your message...",
//                 border: OutlineInputBorder(),
//               ),
//               onSubmitted: (_) => _submitMessage(),
//             ),
//           ),
//           const SizedBox(width: 8),
//           CircleAvatar(
//             backgroundColor: const Color(0xFF00796B),
//             child: IconButton(
//               icon: const Icon(Icons.send, color: Colors.white),
//               onPressed: _inputEnabled ? _submitMessage : null,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _submitMessage() {
//     final text = _inputCtrl.text.trim();
//     if (text.isEmpty) return;
//
//     _inputCtrl.clear();
//     _sendUserMessage(text);
//   }
// }
// import 'dart:convert';
//
// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
// import 'package:flutter_chat_ui/flutter_chat_ui.dart';
// import 'package:fsm/core/theme/app_colors.dart';
// import 'package:fsm/core/widgets/fsm_app_bar.dart';
// import 'package:fsm/features/auth/presentation/blocs/auth/auth_state.dart';
// import 'package:http/http.dart' as http;
// import 'package:uuid/uuid.dart';
//
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
//   final List<types.Message> _messages = [];
//   final _user = const types.User(id: 'user-1', firstName: 'You');
//   final _bot = const types.User(id: 'bot-1', firstName: 'FSM Agent');
//
//   bool _isBotTyping = false;
//   bool _inputEnabled = false;
//   final TextEditingController _textCtrl = TextEditingController();
//
//   // API Configuration
//   static const String _apiUrl = 'http://172.16.117.136:8066/api/chat';
//   String? _authToken;
//   String? _userEmail;
//   String _sessionId = const Uuid().v4();
//   String? _error;
//
//   @override
//   void initState() {
//     super.initState();
//     _bootstrap();
//   }
//
//   @override
//   void dispose() {
//     _textCtrl.dispose();
//     super.dispose();
//   }
//
//   // Bootstrap: Extract token from AuthBloc
//   Future<void> _bootstrap() async {
//     try {
//       final authState = BlocProvider.of<AuthBloc>(context).state;
//
//       // Extract access token and user email using maybeWhen
//       final token = authState.maybeWhen(
//         authenticated: (user) => user.accessToken,
//         orElse: () => null,
//       );
//
//       final email = authState.maybeWhen(
//         authenticated: (user) => user.email, // Adjust field name if different
//         orElse: () => null,
//       );
//
//       if (token == null) {
//         setState(() {
//           _error = "Authentication expired. Please log in again.";
//           _inputEnabled = false;
//         });
//         _showErrorMessage();
//         return;
//       }
//
//       setState(() {
//         _authToken = token;
//         _userEmail = email;
//         _error = null;
//       });
//
//       await _startSession();
//     } catch (e) {
//       setState(() {
//         _error = "Failed to initialize chat: ${e.toString()}";
//         _inputEnabled = false;
//       });
//       _showErrorMessage();
//     }
//   }
//
//   // Start session and add welcome message
//   Future<void> _startSession() async {
//     setState(() {
//       _isBotTyping = true;
//     });
//
//     // Generate new session ID
//     _sessionId = const Uuid().v4();
//
//     setState(() {
//       _inputEnabled = true;
//       _isBotTyping = false;
//     });
//
//     _addInitialBotMessage();
//   }
//
//   void _addInitialBotMessage() {
//     final initialMessage = types.TextMessage(
//       author: _bot,
//       id: const Uuid().v4(),
//       text:
//           "Hi I am FSM Agent, your assistant for anything and everything related to FSM. Which module do you need help with?",
//     );
//
//     setState(() {
//       _messages.add(initialMessage);
//     });
//   }
//
//   void _showErrorMessage() {
//     if (_error != null) {
//       final errorMessage = types.TextMessage(
//         author: _bot,
//         id: const Uuid().v4(),
//         text: _error!,
//       );
//
//       setState(() {
//         _messages.insert(0, errorMessage);
//       });
//     }
//   }
//
//   types.TextMessage _buildTypingPlaceholder() {
//     return types.TextMessage(
//       author: _bot,
//       id: '__typing__',
//       text: 'typing...',
//     );
//   }
//
//   // API Call Function with authentication
//   Future<String> _sendMessageToAPI(String query) async {
//     if (_authToken == null) {
//       return 'Authentication error. Please log in again.';
//     }
//
//     try {
//       final response = await http.post(
//         Uri.parse(_apiUrl),
//         headers: {
//           'accept': 'application/json',
//           'Authorization': 'Bearer $_authToken',
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode({
//           'query': query,
//           'session_id': _sessionId,
//         }),
//       );
//
//       if (response.statusCode == 200) {
//         final jsonResponse = jsonDecode(response.body);
//
//         // Extract message from response
//         if (jsonResponse['success'] == true &&
//             jsonResponse['message'] != null) {
//           return jsonResponse['message'];
//         } else {
//           return jsonResponse['message'] ??
//               'Sorry, I could not process your request.';
//         }
//       } else if (response.statusCode == 401) {
//         // Token expired or invalid
//         setState(() {
//           _error = "Session expired. Please log in again.";
//           _inputEnabled = false;
//         });
//         return 'Your session has expired. Please log in again.';
//       } else {
//         return 'Sorry, there was an error connecting to the server. Please try again.';
//       }
//     } catch (e) {
//       debugPrint('Error calling API: $e');
//       return 'Sorry, I encountered an error. Please check your connection and try again.';
//     }
//   }
//
//   void _handleSendPressed(types.PartialText message) async {
//     if (!_inputEnabled || _authToken == null) return;
//
//     final userMessage = types.TextMessage(
//       author: _user,
//       id: const Uuid().v4(),
//       text: message.text,
//     );
//
//     setState(() {
//       _messages.insert(0, userMessage);
//       _isBotTyping = true;
//       _messages.insert(0, _buildTypingPlaceholder());
//       _inputEnabled = false;
//     });
//
//     // Call API
//     final botResponseText = await _sendMessageToAPI(message.text);
//
//     final botReply = types.TextMessage(
//       author: _bot,
//       id: const Uuid().v4(),
//       text: botResponseText,
//     );
//
//     setState(() {
//       _isBotTyping = false;
//       _inputEnabled =
//           _authToken != null; // Re-enable only if still authenticated
//       _messages.removeWhere((m) => m.id == '__typing__');
//       _messages.insert(0, botReply);
//     });
//   }
//
//   void _clearChat() {
//     setState(() {
//       _messages.clear();
//       _isBotTyping = false;
//       _sessionId = const Uuid().v4(); // Generate new session ID
//     });
//     _addInitialBotMessage();
//
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text("Chat cleared."),
//         duration: Duration(seconds: 1),
//       ),
//     );
//   }
//
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
//       appBar: FSMAppBar.gradient(
//         titleWidget: Row(children: const [
//           Icon(Icons.smart_toy, color: Colors.white),
//           SizedBox(width: 8),
//           Text('AI Assistant')
//         ]),
//         actions: [
//           IconButton(
//             tooltip: 'Clear chat',
//             icon: const Icon(Icons.delete_outline, color: Colors.white),
//             onPressed: _messages.isEmpty ? null : _clearChat,
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             if (_isBotTyping) const SizedBox(height: 8),
//             Expanded(
//               child: _error != null && _authToken == null
//                   ? Center(
//                       child: Padding(
//                         padding: const EdgeInsets.all(24.0),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(
//                               Icons.error_outline,
//                               size: 64,
//                               color: Colors.red[300],
//                             ),
//                             const SizedBox(height: 16),
//                             Text(
//                               _error!,
//                               textAlign: TextAlign.center,
//                               style: const TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.red,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     )
//                   : Chat(
//                       messages: _messages,
//                       user: _user,
//                       onSendPressed: (_) {},
//                       scrollPhysics: const BouncingScrollPhysics(),
//                       bubbleBuilder: (child,
//                           {required message, required nextMessageInGroup}) {
//                         final isUserMessage = message.author.id == _user.id;
//                         final isTypingPlaceholder = message.id == '__typing__';
//
//                         if (isTypingPlaceholder) {
//                           return Align(
//                             alignment: Alignment.centerLeft,
//                             child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 const CircleAvatar(
//                                   radius: 16,
//                                   backgroundColor: Color(0xFF00796B),
//                                   child: Icon(Icons.smart_toy,
//                                       color: Colors.white, size: 18),
//                                 ),
//                                 const SizedBox(width: 8),
//                                 Container(
//                                   margin:
//                                       const EdgeInsets.symmetric(vertical: 4),
//                                   padding: const EdgeInsets.all(10),
//                                   decoration: BoxDecoration(
//                                     color: const Color(0xFFE5F4F1),
//                                     borderRadius: BorderRadius.circular(16),
//                                   ),
//                                   child: const _TypingDots(),
//                                 ),
//                               ],
//                             ),
//                           );
//                         }
//
//                         return Align(
//                           alignment: isUserMessage
//                               ? Alignment.centerRight
//                               : Alignment.centerLeft,
//                           child: Container(
//                             margin: const EdgeInsets.symmetric(
//                                 vertical: 4, horizontal: 12),
//                             padding: const EdgeInsets.all(12),
//                             decoration: BoxDecoration(
//                               color: isUserMessage
//                                   ? const Color(0xFF00796B)
//                                   : const Color(0xFFE5F4F1),
//                               borderRadius: BorderRadius.only(
//                                 topLeft: const Radius.circular(16),
//                                 topRight: const Radius.circular(16),
//                                 bottomLeft: isUserMessage
//                                     ? const Radius.circular(16)
//                                     : const Radius.circular(0),
//                                 bottomRight: isUserMessage
//                                     ? const Radius.circular(0)
//                                     : const Radius.circular(16),
//                               ),
//                             ),
//                             child: Text(
//                               (message as types.TextMessage).text,
//                               style: TextStyle(
//                                 color: isUserMessage
//                                     ? Colors.white
//                                     : Colors.black87,
//                                 fontSize: 15,
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                       showUserAvatars: false,
//                       showUserNames: true,
//                       theme: DefaultChatTheme(
//                         primaryColor: AppColors.primary,
//                         secondaryColor: AppColors.surface,
//                         inputBackgroundColor: AppColors.surface,
//                         inputTextColor: AppColors.textPrimary,
//                         backgroundColor: Colors.white,
//                         inputMargin: const EdgeInsets.symmetric(
//                             horizontal: 8, vertical: 4),
//                       ),
//                       customBottomWidget: const SizedBox.shrink(),
//                     ),
//             ),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//               decoration: BoxDecoration(
//                 color: AppColors.surface,
//                 border: Border(top: BorderSide(color: AppColors.divider)),
//               ),
//               child: Row(
//                 children: [
//                   IconButton(
//                     icon: Icon(Icons.attach_file, color: AppColors.primary),
//                     onPressed: _inputEnabled ? () {} : null,
//                   ),
//                   Expanded(
//                     child: TextField(
//                       controller: _textCtrl,
//                       enabled: _inputEnabled,
//                       maxLines: null,
//                       minLines: 1,
//                       decoration: const InputDecoration(
//                         hintText: 'Type your message...',
//                         border: InputBorder.none,
//                         contentPadding: EdgeInsets.symmetric(vertical: 8),
//                       ),
//                       onSubmitted: (_) => _trySend(),
//                     ),
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.send, color: AppColors.primary),
//                     onPressed: _inputEnabled ? _trySend : null,
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
import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:fsm/core/theme/app_colors.dart';
import 'package:fsm/core/widgets/fsm_app_bar.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/di/injection.dart';
import '../../../auth/data/datasources/auth_local_datasource.dart';

@RoutePage()
class ChatbotPage extends StatefulWidget {
  const ChatbotPage({super.key});

  @override
  State<ChatbotPage> createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  final List<types.Message> _messages = [];
  final _user = const types.User(id: 'user-1', firstName: 'You');
  final _bot = const types.User(id: 'bot-1', firstName: 'FSM Agent');

  bool _isBotTyping = false;
  bool _inputEnabled = false;
  final TextEditingController _textCtrl = TextEditingController();

  // API Configuration
  static const String _apiUrl = 'http://172.16.117.136:8066/api/chat';
  String? _authToken;
  String? _refreshToken;
  String _sessionId = const Uuid().v4();
  String? _error;

  @override
  void initState() {
    super.initState();
    _bootstrap();
  }

  @override
  void dispose() {
    _textCtrl.dispose();
    super.dispose();
  }

  // Bootstrap: Extract token from AuthBloc
  // Future<void> _bootstrap() async {
  //   try {
  //     final authState = BlocProvider.of<AuthBloc>(context).state;
  //
  //     // Extract access token and user email using maybeWhen
  //     final token = authState.maybeWhen(
  //       authenticated: (user) => user.accessToken,
  //       orElse: () => null,
  //     );
  //     _refreshToken = authState.maybeWhen(
  //       authenticated: (user) => user.refreshToken,
  //       orElse: () => null,
  //     );
  //
  //     if (token == null) {
  //       setState(() {
  //         _error = "Authentication expired. Please log in again.";
  //         _inputEnabled = false;
  //       });
  //       _showErrorMessage();
  //       return;
  //     }
  //
  //     setState(() {
  //       _authToken = token;
  //       // _userEmail = email;
  //       _refreshToken;
  //       _error = null;
  //     });
  //
  //     await _startSession();
  //   } catch (e) {
  //     setState(() {
  //       _error = "Failed to initialize chat: ${e.toString()}";
  //       _inputEnabled = false;
  //     });
  //     _showErrorMessage();
  //   }
  // }
  Future<void> _bootstrap() async {
    try {
      final authLocal = getIt<AuthLocalDataSource>();

      final token = await authLocal.getAccessToken();
      final refreshToken = await authLocal.getRefreshToken();

      if (token == null || refreshToken == null) {
        setState(() {
          _error = "Authentication expired. Please log in again.";
          _inputEnabled = false;
        });
        _showErrorMessage();
        return;
      }

      setState(() {
        _authToken = token;
        _refreshToken = refreshToken;
        _error = null;
      });

      await _startSession();
    } catch (e) {
      setState(() {
        _error = "Failed to initialize chat: ${e.toString()}";
        _inputEnabled = false;
      });
      _showErrorMessage();
    }
  }

  // Start session and add welcome message
  Future<void> _startSession() async {
    setState(() {
      _isBotTyping = true;
    });

    // Generate new session ID
    _sessionId = const Uuid().v4();

    setState(() {
      _inputEnabled = true;
      _isBotTyping = false;
    });

    _addInitialBotMessage();
  }

  void _addInitialBotMessage() {
    final initialMessage = types.TextMessage(
      author: _bot,
      id: const Uuid().v4(),
      text:
          "Hi I am FSM Agent, your assistant for anything and everything related to FSM. Which module do you need help with?",
    );

    setState(() {
      _messages.add(initialMessage);
    });
  }

  void _showErrorMessage() {
    if (_error != null) {
      final errorMessage = types.TextMessage(
        author: _bot,
        id: const Uuid().v4(),
        text: _error!,
      );

      setState(() {
        _messages.insert(0, errorMessage);
      });
    }
  }

  types.TextMessage _buildTypingPlaceholder() {
    return types.TextMessage(
      author: _bot,
      id: '__typing__',
      text: 'typing...',
    );
  }

  Future<String> _sendMessageToAPI(String query) async {
    if (_authToken == null) {
      return 'Authentication error. Please log in again.';
    }

    try {
      final dio = getIt<Dio>(); // <-- USE GLOBAL DIO CLIENT

      final response = await dio.post(
        _apiUrl,
        data: {
          "query": query,
          "session_id": _sessionId,
        },
        options: Options(
          headers: {
            "Authorization": "Bearer $_authToken",
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
        ),
      );

      final data = response.data;

      if (data["success"] == true && data["message"] != null) {
        return data["message"];
      } else {
        return data["message"] ?? "Sorry, I could not process your request.";
      }
    } catch (e) {
      debugPrint("Chat API error: $e");
      return "Sorry, I encountered an error. Please check your connection and try again.";
    }
  }

  void _handleSendPressed(types.PartialText message) async {
    if (!_inputEnabled || _authToken == null) return;

    final userMessage = types.TextMessage(
      author: _user,
      id: const Uuid().v4(),
      text: message.text,
    );

    setState(() {
      _messages.insert(0, userMessage);
      _isBotTyping = true;
      _messages.insert(0, _buildTypingPlaceholder());
      _inputEnabled = false;
    });

    // Call API
    final botResponseText = await _sendMessageToAPI(message.text);

    final botReply = types.TextMessage(
      author: _bot,
      id: const Uuid().v4(),
      text: botResponseText,
    );

    setState(() {
      _isBotTyping = false;
      _inputEnabled =
          _authToken != null; // Re-enable only if still authenticated
      _messages.removeWhere((m) => m.id == '__typing__');
      _messages.insert(0, botReply);
    });
  }

  void _clearChat() {
    setState(() {
      _messages.clear();
      _isBotTyping = false;
      _sessionId = const Uuid().v4(); // Generate new session ID
    });
    _addInitialBotMessage();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Chat cleared."),
        duration: Duration(seconds: 1),
      ),
    );
  }

  void _trySend() {
    final text = _textCtrl.text.trim();
    if (text.isEmpty) return;
    _textCtrl.clear();
    _handleSendPressed(types.PartialText(text: text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FSMAppBar.gradient(
        titleWidget: Row(children: [
          Icon(Icons.smart_toy, color: Colors.white),
          SizedBox(width: 8),
          Text('AI Assistant')
        ]),
        actions: [
          IconButton(
            tooltip: 'Clear chat',
            icon: const Icon(Icons.delete_outline, color: Colors.white),
            onPressed: _messages.isEmpty ? null : _clearChat,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            if (_isBotTyping) const SizedBox(height: 8),
            Expanded(
              child: _error != null && _authToken == null
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error_outline,
                              size: 64,
                              color: Theme.of(context).colorScheme.error,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              _error!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).colorScheme.error,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Chat(
                      messages: _messages,
                      user: _user,
                      onSendPressed: (_) {},
                      scrollPhysics: const BouncingScrollPhysics(),
                      bubbleBuilder: (child,
                          {required message, required nextMessageInGroup}) {
                        final isUserMessage = message.author.id == _user.id;
                        final isTypingPlaceholder = message.id == '__typing__';

                        if (isTypingPlaceholder) {
                          return Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CircleAvatar(
                                  radius: 16,
                                  // backgroundColor: Color(0xFF00796B),
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  child: Icon(Icons.smart_toy,
                                      color: Colors.white, size: 18),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 4),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: const _TypingDots(),
                                ),
                              ],
                            ),
                          );
                        }

                        return Align(
                          alignment: isUserMessage
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 12),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: isUserMessage
                                  // ? const Color(0xFF00796B)
                                  ? Theme.of(context).primaryColor
                                  : const Color(0xFFE5F4F1),
                              borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(16),
                                topRight: const Radius.circular(16),
                                bottomLeft: isUserMessage
                                    ? const Radius.circular(16)
                                    : const Radius.circular(0),
                                bottomRight: isUserMessage
                                    ? const Radius.circular(0)
                                    : const Radius.circular(16),
                              ),
                            ),
                            child: Text(
                              (message as types.TextMessage).text,
                              style: TextStyle(
                                color: isUserMessage
                                    ? Colors.white
                                    : Colors.black87,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        );
                      },
                      showUserAvatars: false,
                      showUserNames: true,
                      theme: DefaultChatTheme(
                        primaryColor: AppColors.primary,
                        secondaryColor: AppColors.surface,
                        inputBackgroundColor: AppColors.surface,
                        inputTextColor: AppColors.textPrimary,
                        backgroundColor: Colors.white,
                        inputMargin: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                      ),
                      customBottomWidget: const SizedBox.shrink(),
                    ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.surface,
                border: Border(top: BorderSide(color: AppColors.divider)),
              ),
              child: Row(
                children: [
                  // IconButton(
                  //   icon: Icon(Icons.attach_file, color: AppColors.primary),
                  //   onPressed: _inputEnabled ? () {} : null,
                  // ),
                  Expanded(
                    child: TextField(
                      controller: _textCtrl,
                      enabled: _inputEnabled,
                      maxLines: null,
                      minLines: 1,
                      decoration: const InputDecoration(
                        hintText: 'Type your message...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 8),
                      ),
                      onSubmitted: (_) => _trySend(),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send, color: AppColors.primary),
                    onPressed: _inputEnabled ? _trySend : null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TypingDots extends StatefulWidget {
  const _TypingDots();

  @override
  State<_TypingDots> createState() => _TypingDotsState();
}

class _TypingDotsState extends State<_TypingDots>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (index) {
        return AnimatedBuilder(
          animation: _controller,
          builder: (_, __) {
            double t = (_controller.value + (index * 0.2)) % 1.0;
            double opacity = t < 0.5 ? 1.0 - (t * 2) : (t - 0.5) * 2;
            return Opacity(
              opacity: opacity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    // color: Color(0xFF00796B),
                    color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
