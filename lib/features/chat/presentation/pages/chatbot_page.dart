// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
// import 'package:flutter_chat_ui/flutter_chat_ui.dart';
// import 'package:fsm/core/theme/app_colors.dart';
// import 'package:fsm/core/widgets/fsm_app_bar.dart';
// import 'package:uuid/uuid.dart';
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
//   bool _inputEnabled = true;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _addInitialBotMessage();
//   }
//
//   // --- Auto initial bot message
//   void _addInitialBotMessage() {
//     final initialMessage = types.TextMessage(
//       author: _bot,
//       // createdAt: DateTime.now().millisecondsSinceEpoch,
//       id: const Uuid().v4(),
//       text:
//           "Hi I am FSM Agent, your assistant for anything and everything related to FSM. Which module do you need help with?",
//     );
//
//     setState(() {
//       // Add it at the top so it appears first
//       _messages.add(initialMessage);
//     });
//   }
//
//   types.TextMessage _buildTypingPlaceholder() {
//     return types.TextMessage(
//       author: _bot,
//       id: '__typing__',
//       // createdAt: DateTime.now().millisecondsSinceEpoch,
//       text: 'typing...', // won’t actually display, we’ll render dots instead
//     );
//   }
//
//   // --- Send message logic
//   void _handleSendPressed(types.PartialText message) async {
//     if (!_inputEnabled) return;
//
//     final userMessage = types.TextMessage(
//       author: _user,
//       id: const Uuid().v4(),
//       // createdAt: DateTime.now().millisecondsSinceEpoch,
//       text: message.text,
//     );
//
//     setState(() {
//       _messages.insert(0, userMessage);
//       _isBotTyping = true;
//
//       // 👇 Add typing placeholder into the message list
//       _messages.insert(0, _buildTypingPlaceholder());
//       _inputEnabled = false;
//     });
//
//     // Simulate delay
//     await Future.delayed(const Duration(seconds: 1));
//
//     final botReply = types.TextMessage(
//       author: _bot,
//       id: const Uuid().v4(),
//       // createdAt: DateTime.now().millisecondsSinceEpoch,
//       text:
//           "Sure! Could you please specify which FSM module you want help with?",
//     );
//
//     setState(() {
//       _isBotTyping = false;
//       _inputEnabled = true;
//
//       // 👇 Remove typing placeholder before adding actual reply
//       _messages.removeWhere((m) => m.id == '__typing__');
//       _messages.insert(0, botReply);
//     });
//   }
//
//   // --- Clear chat
//   void _clearChat() {
//     setState(() {
//       _messages.clear();
//       _isBotTyping = false;
//       _inputEnabled = true;
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
//   // ADD THIS HERE inside _ChatbotPageState
//   final TextEditingController _textCtrl = TextEditingController();
//
//   Widget _buildComposer() {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
//       decoration: BoxDecoration(
//         color: AppColors.surface,
//         border: Border(top: BorderSide(color: AppColors.divider, width: 1)),
//       ),
//       child: Row(
//         children: [
//           IconButton(
//             icon: Icon(Icons.attach_file, color: AppColors.primary),
//             onPressed: _inputEnabled
//                 ? () {
//                     // static for now
//                   }
//                 : null,
//           ),
//           Expanded(
//             child: TextField(
//               controller: _textCtrl,
//               enabled: _inputEnabled,
//               maxLines: null,
//               minLines: 1,
//               decoration: const InputDecoration(
//                 hintText: 'Type your message...',
//                 border: InputBorder.none,
//               ),
//               onSubmitted: (_) => _trySend(),
//             ),
//           ),
//           IconButton(
//             icon: Icon(Icons.send, color: AppColors.primary),
//             onPressed: _inputEnabled ? _trySend : null,
//           ),
//         ],
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
//         //  ensures full screen fit within system insets
//         child: Column(
//           children: [
//             if (_isBotTyping) const SizedBox(height: 8),
//
//             //  fills all available space above textfield
//             Expanded(
//               child: Chat(
//                 messages: _messages,
//                 user: _user,
//                 onSendPressed: (_) {},
//                 scrollPhysics: const BouncingScrollPhysics(),
//                 bubbleBuilder: (child,
//                     {required message, required nextMessageInGroup}) {
//                   final isUserMessage = message.author.id == _user.id;
//                   final isTypingPlaceholder = message.id == '__typing__';
//                   if (isTypingPlaceholder) {
//                     return Align(
//                       alignment: Alignment.centerLeft,
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           // Bot avatar
//                           const CircleAvatar(
//                             radius: 16,
//                             backgroundColor: Color(0xFF00796B),
//                             child: Icon(Icons.smart_toy,
//                                 color: Colors.white, size: 18),
//                           ),
//                           const SizedBox(width: 8),
//                           // Typing dots bubble
//                           Container(
//                             margin: const EdgeInsets.symmetric(vertical: 4),
//                             padding: const EdgeInsets.all(10),
//                             decoration: BoxDecoration(
//                               color: const Color(0xFFE5F4F1),
//                               borderRadius: BorderRadius.circular(16),
//                             ),
//                             child: const _TypingDots(),
//                           ),
//                         ],
//                       ),
//                     );
//                   }
//
//                   return Align(
//                     alignment: isUserMessage
//                         ? Alignment.centerRight
//                         : Alignment.centerLeft,
//                     child: Container(
//                       margin: const EdgeInsets.symmetric(
//                           vertical: 4, horizontal: 12), // uniform padding
//                       padding: const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: isUserMessage
//                             ? const Color(0xFF00796B)
//                             : const Color(0xFFE5F4F1),
//                         borderRadius: BorderRadius.only(
//                           topLeft: const Radius.circular(16),
//                           topRight: const Radius.circular(16),
//                           bottomLeft: isUserMessage
//                               ? const Radius.circular(16)
//                               : const Radius.circular(0),
//                           bottomRight: isUserMessage
//                               ? const Radius.circular(0)
//                               : const Radius.circular(16),
//                         ),
//                       ),
//                       child: Text(
//                         (message as types.TextMessage).text,
//                         style: TextStyle(
//                           color: isUserMessage ? Colors.white : Colors.black87,
//                           fontSize: 15,
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//                 showUserAvatars: false,
//                 showUserNames: true,
//                 theme: DefaultChatTheme(
//                   primaryColor: AppColors.primary,
//                   secondaryColor: AppColors.surface,
//                   inputBackgroundColor: AppColors.surface,
//                   inputTextColor: AppColors.textPrimary,
//                   backgroundColor: Colors.white,
//                   inputMargin:
//                       const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                 ),
//                 customBottomWidget:
//                     const SizedBox.shrink(), // handled separately below
//               ),
//             ),
//
//             //  text field pinned to bottom with padding
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
// import 'package:auto_route/auto_route.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
// import 'package:flutter_chat_ui/flutter_chat_ui.dart';
// import 'package:fsm/core/theme/app_colors.dart';
// import 'package:fsm/core/widgets/fsm_app_bar.dart';
// import 'package:uuid/uuid.dart';
//
// /// Replace this with your actual chatbot endpoint
// const String chatbotApiUrl = "https://api.yourserver.com/chatbot/respond";
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
//   final TextEditingController _textCtrl = TextEditingController();
//   final Dio _dio = Dio();
//
//   bool _isBotTyping = false;
//   bool _inputEnabled = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _addInitialBotMessage();
//   }
//
//   /// 👋 Initial bot greeting message
//   void _addInitialBotMessage() {
//     final initialMessage = types.TextMessage(
//       author: _bot,
//       id: const Uuid().v4(),
//       text:
//       "Hi, I am FSM Agent — your assistant for anything related to FSM. Which module do you need help with?",
//     );
//     setState(() => _messages.add(initialMessage));
//   }
//
//   /// ✉️ Handles user message send
//   void _handleSendPressed(types.PartialText message) async {
//     if (!_inputEnabled) return;
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
//     try {
//       final botResponse = await _sendMessageToBot(message.text);
//
//       final botReply = types.TextMessage(
//         author: _bot,
//         id: const Uuid().v4(),
//         text: botResponse,
//       );
//
//       setState(() {
//         _isBotTyping = false;
//         _inputEnabled = true;
//         _messages.removeWhere((m) => m.id == '__typing__');
//         _messages.insert(0, botReply);
//       });
//     } catch (e) {
//       setState(() {
//         _isBotTyping = false;
//         _inputEnabled = true;
//         _messages.removeWhere((m) => m.id == '__typing__');
//       });
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error: $e')),
//       );
//     }
//   }
//
//   /// 🌐 API Call to backend chatbot using Dio
//   Future<String> _sendMessageToBot(String message) async {
//     try {
//       final response = await _dio.post(
//         chatbotApiUrl,
//         data: {'message': message},
//         options: Options(
//           headers: {'Content-Type': 'application/json'},
//           sendTimeout: const Duration(seconds: 10),
//           receiveTimeout: const Duration(seconds: 20),
//         ),
//       );
//
//       if (response.statusCode == 200) {
//         // Expecting { "reply": "..." }
//         final data = response.data;
//         return data['reply'] ?? "I'm sorry, I didn’t get that.";
//       } else {
//         throw Exception("Server error: ${response.statusCode}");
//       }
//     } catch (e) {
//       throw Exception("Chatbot API error: $e");
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
//   /// 🧹 Clear chat
//   void _clearChat() {
//     setState(() {
//       _messages.clear();
//       _isBotTyping = false;
//       _inputEnabled = true;
//     });
//     _addInitialBotMessage();
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
//           Text('AI Assistant'),
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
//               child: Chat(
//                 messages: _messages,
//                 user: _user,
//                 onSendPressed: (_) {},
//                 scrollPhysics: const BouncingScrollPhysics(),
//                 bubbleBuilder: (child,
//                     {required message, required nextMessageInGroup}) {
//                   final isUserMessage = message.author.id == _user.id;
//                   final isTypingPlaceholder = message.id == '__typing__';
//                   if (isTypingPlaceholder) {
//                     return Align(
//                       alignment: Alignment.centerLeft,
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           const CircleAvatar(
//                             radius: 16,
//                             backgroundColor: Color(0xFF00796B),
//                             child: Icon(Icons.smart_toy,
//                                 color: Colors.white, size: 18),
//                           ),
//                           const SizedBox(width: 8),
//                           Container(
//                             margin: const EdgeInsets.symmetric(vertical: 4),
//                             padding: const EdgeInsets.all(10),
//                             decoration: BoxDecoration(
//                               color: const Color(0xFFE5F4F1),
//                               borderRadius: BorderRadius.circular(16),
//                             ),
//                             child: const _TypingDots(),
//                           ),
//                         ],
//                       ),
//                     );
//                   }
//
//                   return Align(
//                     alignment: isUserMessage
//                         ? Alignment.centerRight
//                         : Alignment.centerLeft,
//                     child: Container(
//                       margin: const EdgeInsets.symmetric(
//                           vertical: 4, horizontal: 12),
//                       padding: const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: isUserMessage
//                             ? const Color(0xFF00796B)
//                             : const Color(0xFFE5F4F1),
//                         borderRadius: BorderRadius.only(
//                           topLeft: const Radius.circular(16),
//                           topRight: const Radius.circular(16),
//                           bottomLeft: isUserMessage
//                               ? const Radius.circular(16)
//                               : const Radius.circular(0),
//                           bottomRight: isUserMessage
//                               ? const Radius.circular(0)
//                               : const Radius.circular(16),
//                         ),
//                       ),
//                       child: Text(
//                         (message as types.TextMessage).text,
//                         style: TextStyle(
//                           color: isUserMessage ? Colors.white : Colors.black87,
//                           fontSize: 15,
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//                 showUserAvatars: false,
//                 showUserNames: true,
//                 theme: DefaultChatTheme(
//                   primaryColor: AppColors.primary,
//                   secondaryColor: AppColors.surface,
//                   inputBackgroundColor: AppColors.surface,
//                   inputTextColor: AppColors.textPrimary,
//                   backgroundColor: Colors.white,
//                 ),
//                 customBottomWidget: const SizedBox.shrink(),
//               ),
//             ),
//
//             // Custom composer
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
// /// 💬 Animated typing indicator for the bot
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
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:fsm/core/theme/app_colors.dart';
import 'package:fsm/core/widgets/fsm_app_bar.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

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
  final TextEditingController _textCtrl = TextEditingController();

  final Dio _dio = Dio(BaseOptions(
    baseUrl: "http://10.0.2.2:8000",
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 20),
  ));
  String? _token;
  String? _attachedDocumentId;

  bool _isBotTyping = false;
  bool _inputEnabled = true;

  @override
  void initState() {
    super.initState();
    _initializeChatbot();
  }

  Future<void> _initializeChatbot() async {
    // await _loadToken();
    _addInitialBotMessage();
    await _getSessionInfo();
  }

  // Future<void> _loadToken() async {
  //   try {
  //     // final prefs = await SharedPreferences.getInstance();
  //     // final storedToken = prefs.getString('access_token');
  //
  //     if (storedToken != null && storedToken.isNotEmpty) {
  //       setState(() => _token = "Bearer $storedToken");
  //       debugPrint("✅ Loaded token for authenticated user");
  //     } else {
  //       debugPrint("⚠️ No token found. User not logged in.");
  //       setState(() => _token = null);
  //     }
  //   } catch (e) {
  //     debugPrint("❌ Error loading token: $e");
  //   }
  // }

  void _addInitialBotMessage() {
    final initialMessage = types.TextMessage(
      author: _bot,
      id: const Uuid().v4(),
      text:
          "Hi 👋 I’m FSM Agent, your assistant for anything related to FSM. How can I help you today?",
    );
    setState(() => _messages.add(initialMessage));
  }

  Future<Map<String, dynamic>> _callApi({
    required String endpoint,
    required String method,
    Map<String, dynamic>? body,
  }) async {
    final options = Options(
      headers: {
        // if (_token != null) "Authorization": _token!,
        "Content-Type": "application/json",
        "accept": "application/json",
      },
    );

    try {
      Response response;
      if (method == "POST") {
        response = await _dio.post(endpoint, data: body, options: options);
      } else {
        response = await _dio.get(endpoint, options: options);
      }

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception("Unexpected status: ${response.statusCode}");
      }
    } on DioException catch (e) {
      debugPrint("❌ API error at $endpoint: ${e.message}");
      throw Exception(
          e.response?.data?['detail'] ?? 'Network error: ${e.message}');
    } catch (e) {
      debugPrint("❌ Unknown error calling $endpoint: $e");
      throw Exception("Something went wrong. Please try again.");
    }
  }

  Future<String> _sendMessageToBot(String message) async {
    final chatRes = await _callApi(
      endpoint: "/mobile/chat/query",
      method: "POST",
      body: {"message": message},
    );

    final intent = chatRes["intent"] ?? "";
    final answer = chatRes["answer"] ?? "No response from FSM Agent.";

    if (intent == "document_search" && chatRes["source_doc"] != null) {
      final source = chatRes["source_doc"];
      final docId = source["document_id"];
      final docTitle = source["title"];
      _attachedDocumentId = docId;

      await _callApi(
        endpoint: "/mobile/chat/select_document",
        method: "POST",
        body: {"document_id": docId},
      );

      return "$answer\n\n📎 Document '$docTitle' attached for further questions.";
    }

    if (intent == "ticket_tracking") {
      final ticketRes = await _callApi(
        endpoint: "/ticket/track",
        method: "POST",
        body: {"message": message},
      );
      return ticketRes["answer"] ??
          "No ticket tracking information available right now.";
    }

    if (_attachedDocumentId != null &&
        (message.toLowerCase().contains("document") ||
            message.toLowerCase().contains("section") ||
            message.toLowerCase().contains("page"))) {
      final docRes = await _callApi(
        endpoint: "/document/query",
        method: "POST",
        body: {
          "document_id": _attachedDocumentId,
          "question": message,
          "top_k": 3,
        },
      );
      return docRes["answer"] ??
          "No relevant information found in the document.";
    }

    return answer;
  }

  Future<void> _getSessionInfo() async {
    try {
      final res =
          await _callApi(endpoint: "/mobile/chat/session_info", method: "GET");
      if (res["document_attached"] == true) {
        _attachedDocumentId = res["current_document"];
      }
    } catch (e) {
      debugPrint("⚠️ Session info fetch failed: $e");
    }
  }

  Future<void> _clearDocument() async {
    try {
      final res = await _callApi(
          endpoint: "/mobile/chat/clear_document", method: "POST");
      _attachedDocumentId = null;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(res["message"] ?? "Document detached.")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error clearing document: $e")),
      );
    }
  }

  types.TextMessage _buildTypingPlaceholder() {
    return types.TextMessage(
      author: _bot,
      id: '__typing__',
      text: 'typing...',
    );
  }

  void _handleSendPressed(types.PartialText message) async {
    if (!_inputEnabled) return;

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

    try {
      final botReplyText = await _sendMessageToBot(message.text);

      final botReply = types.TextMessage(
        author: _bot,
        id: const Uuid().v4(),
        text: botReplyText,
      );

      setState(() {
        _isBotTyping = false;
        _inputEnabled = true;
        _messages.removeWhere((m) => m.id == '__typing__');
        _messages.insert(0, botReply);
      });
    } catch (e) {
      setState(() {
        _isBotTyping = false;
        _inputEnabled = true;
        _messages.removeWhere((m) => m.id == '__typing__');
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  void _clearChat() {
    setState(() {
      _messages.clear();
      _isBotTyping = false;
      _inputEnabled = true;
    });
    _addInitialBotMessage();
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
      resizeToAvoidBottomInset: true,
      appBar: FSMAppBar.gradient(
        titleWidget: Row(children: const [
          Icon(Icons.smart_toy, color: Colors.white),
          SizedBox(width: 8),
          Text('AI Assistant'),
        ]),
        actions: [
          IconButton(
            tooltip: 'Clear chat',
            icon: const Icon(Icons.delete_outline, color: Colors.white),
            onPressed: _messages.isEmpty ? null : _clearChat,
          ),
          IconButton(
            tooltip: 'Clear document',
            icon: const Icon(Icons.clear, color: Colors.white),
            onPressed: _attachedDocumentId == null ? null : _clearDocument,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Chat(
                messages: _messages,
                user: _user,
                onSendPressed: (_) {},
                scrollPhysics: const BouncingScrollPhysics(),
                bubbleBuilder: (child,
                    {required message, required nextMessageInGroup}) {
                  final isUserMessage = message.author.id == _user.id;
                  final isTypingPlaceholder = message.id == '__typing__';

                  if (isTypingPlaceholder) {
                    return const _TypingIndicator();
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
                            ? const Color(0xFF00796B)
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
                          color: isUserMessage ? Colors.white : Colors.black87,
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
                  backgroundColor: Colors.white,
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
                  IconButton(
                    icon: Icon(Icons.attach_file, color: AppColors.primary),
                    onPressed: _inputEnabled ? () {} : null,
                  ),
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

class _TypingIndicator extends StatefulWidget {
  const _TypingIndicator();

  @override
  State<_TypingIndicator> createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<_TypingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000))
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
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
                    decoration: const BoxDecoration(
                      color: Color(0xFF00796B),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
