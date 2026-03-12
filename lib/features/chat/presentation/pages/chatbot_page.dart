import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:fsm/core/theme/app_colors.dart';
import 'package:fsm/core/widgets/fsm_app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/di/injection.dart';
import '../../../auth/data/datasources/auth_local_datasource.dart';

@RoutePage()
class ChatbotPage extends StatefulWidget {
  final String userName;
  const ChatbotPage({super.key, required this.userName});

  @override
  State<ChatbotPage> createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage>
    with AutomaticKeepAliveClientMixin {
  final List<types.Message> _messages = [];
  final _user = const types.User(id: 'user-1', firstName: 'You');
  final _bot = const types.User(id: 'bot-1', firstName: 'FSM Agent');
  bool _hasText = false;
  bool _isBotTyping = false;
  bool _inputEnabled = false;
  final TextEditingController _textCtrl = TextEditingController();
  bool get _hasUserMessages {
    return _messages.any((m) => m.author.id == _user.id);
  }

  // API Configuration
  static const String _apiUrl =
      'https://unbracketed-royal-sphereless.ngrok-free.dev/api/chat';
  String? _authToken;
  String? _refreshToken;
  // String _sessionId = const Uuid().v4();
  String? _error;
  String? _sessionId;

  @override
  void initState() {
    super.initState();
    _textCtrl.addListener(() {
      final hasText = _textCtrl.text.trim().isNotEmpty;
      if (hasText != _hasText) {
        setState(() {
          _hasText = hasText;
        });
      }
    });
    // _bootstrap();
    _loadOrCreateSession().then((_) => _bootstrap());
  }

  @override
  void dispose() {
    _textCtrl.dispose();
    super.dispose();
  }

  Future<void> _bootstrap() async {
    try {
      final authLocal = getIt<AuthLocalDataSource>();

      final token = await authLocal.getAccessToken();
      final refreshToken = await authLocal.getRefreshToken();

      if (token == null || refreshToken == null) {
        setState(() {
          _error = "Authentication expired. Please login log in again.";
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

    // // Generate new session ID
    // _sessionId = const Uuid().v4();

    setState(() {
      _inputEnabled = true;
      _isBotTyping = false;
    });
    if (_messages.isEmpty) {
      _addInitialBotMessage();
    }

    // _addInitialBotMessage();
  }

  void _addInitialBotMessage() {
    final initialMessage = types.TextMessage(
      author: _bot,
      id: const Uuid().v4(),
      text:
          "Hi ${widget.userName} I am FSM Agent, your assistant for anything and everything related to FSM. Which module do you need help with?",
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
    return types.TextMessage(author: _bot, id: '__typing__', text: 'typing...');
  }

  bool _welcomeMessage(String msg) {
    final t = msg.toLowerCase().trim();
    return [
      'hii',
      'hi'
          'hello',
      'hey',
      'greetings',
      'good morning',
      'good afternoon',
      'good evening',
    ].contains(t);
  }

  String _welcomeMessageResponse() {
    return "Hello! ${widget.userName}, How can I help you today?";
  }

  String _cleanMessage(String msg) {
    return msg.replaceAll('**', '').replaceAll('*', '').trim();
  }

  Future<String> _sendMessageToAPI(String query) async {
    if (_welcomeMessage(query)) {
      return _welcomeMessageResponse();
    }
    if (_authToken == null) {
      return 'Authentication error. Please log in again.';
    }

    try {
      final dio = getIt<Dio>(); // <-- USE GLOBAL DIO CLIENT

      final response = await dio.post(
        _apiUrl,
        data: {"query": query, "session_id": _sessionId},
        options: Options(
          headers: {
            "Authorization": "Bearer $_authToken",
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
        ),
      );

      final data = response.data;
      final rawMessage =
          data["message"] ?? "Sorry, I could not process your request.";
      return _cleanMessage(rawMessage);
    } catch (e) {
      debugPrint("Chat API error: $e");
      return "Sorry, I encountered an error. Please check your connection and try again.";
    }
  }

  Future<void> _loadOrCreateSession() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'chat_session_${widget.userName}';

    final savedSession = prefs.getString(key);

    if (savedSession != null && savedSession.isNotEmpty) {
      _sessionId = savedSession;
    } else {
      _sessionId = const Uuid().v4();
      await prefs.setString(key, _sessionId!);
    }
    debugPrint('CHAT SESSION LOADED => $_sessionId');
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

  Future<void> _clearChat() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'chat_session_${widget.userName}';
    setState(() {
      _messages.clear();
      _isBotTyping = false;
      _hasText = false;
      _sessionId = const Uuid().v4(); // Generate new session ID
    });
    await prefs.setString(key, _sessionId!);
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
    _hasText = false;
    _handleSendPressed(types.PartialText(text: text));
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: FSMAppBar.gradient(
        titleWidget: Row(
          children: [
            Icon(Icons.smart_toy, color: Colors.white),
            SizedBox(width: 8),
            Text('AI Assistant'),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Clear chat',
            icon: Icon(
              Icons.delete_outline,
              color: _hasUserMessages
                  ? Colors.white
                  : Colors.white.withOpacity(0.4),
            ),
            // onPressed: _messages.isEmpty ? null : _clearChat,
            onPressed: _hasUserMessages ? _clearChat : null,
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
                      bubbleBuilder:
                          (
                            child, {
                            required message,
                            required nextMessageInGroup,
                          }) {
                            final isUserMessage = message.author.id == _user.id;
                            final isTypingPlaceholder =
                                message.id == '__typing__';

                            if (isTypingPlaceholder) {
                              return Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    CircleAvatar(
                                      radius: 16,
                                      // backgroundColor: Color(0xFF00796B),
                                      backgroundColor: Theme.of(
                                        context,
                                      ).primaryColor,
                                      child: Icon(
                                        Icons.smart_toy,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                        vertical: 4,
                                      ),
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
                                  vertical: 4,
                                  horizontal: 12,
                                ),
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
                                child: SelectableText(
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
                          horizontal: 8,
                          vertical: 4,
                        ),
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
                    icon: Icon(
                      Icons.send,
                      color: (_inputEnabled && _hasText)
                          ? AppColors.primary
                          : Colors.grey.shade400,
                    ),
                    onPressed: (_inputEnabled && _hasText) ? _trySend : null,
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
