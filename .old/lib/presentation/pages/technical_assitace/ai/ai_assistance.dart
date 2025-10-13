import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsm_flutter/presentation/core/components/gradient_appbar_widget.dart';
import 'package:shimmer/shimmer.dart';

import 'cubit/ai_assistance_cubit.dart';

class AiAssistanceProvider extends StatelessWidget {
  const AiAssistanceProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AIAssistanceCubit(),
      child: AIAssistanceScreen(),
    );
  }
}

class AIAssistanceScreen extends StatefulWidget {
  const AIAssistanceScreen({super.key});

  @override
  State<AIAssistanceScreen> createState() => _AIAssistanceScreenState();
}

class _AIAssistanceScreenState extends State<AIAssistanceScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _controller = TextEditingController();

  void _sendMessage(BuildContext context) {
    final message = _controller.text.trim();
    if (message.isNotEmpty) {
      context.read<AIAssistanceCubit>().sendMessage(message);
      _controller.clear();
      _scrollToBottom();
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

  @override
  void initState() {
    context.read<AIAssistanceCubit>().getHistory();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(title: Text("AI Assistance")),
      body: Container(
        padding: EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<AIAssistanceCubit, AIAssistanceState>(
                builder: (context, state) {
                  if (state is AIAssistanceLoading) {
                    return ListView.builder(
                      controller: _scrollController,
                      itemCount: state.loadingIndex != null
                          ? (state.loadingIndex + 1) * 2
                          : 0,
                      itemBuilder: (context, index) {
                        final isQuery = index.isEven;
                        final showShimmer =
                            isQuery && index == state.loadingIndex;

                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 8.0),
                          child: Column(
                            crossAxisAlignment: isQuery
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: Text(
                                  isQuery ? 'You' : 'AI Chatbot',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: isQuery
                                      ? Colors.blue.shade300
                                      : Colors.grey[300],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: showShimmer
                                    ? Shimmer.fromColors(
                                        baseColor: Colors.grey[300]!,
                                        highlightColor: Colors.grey[100]!,
                                        child: Container(
                                          height: 20.0,
                                          width: 200.0,
                                          color: Colors.white,
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else if (state is AIAssistanceHistoryLoaded) {
                    if (state.result.isNotEmpty) {
                      return ListView.builder(
                        controller: _scrollController,
                        itemCount: state.result.length * 2,
                        itemBuilder: (context, index) {
                          final messageData = state.result[index ~/ 2];
                          final isQuery = index.isEven;
                          final message =
                              isQuery ? messageData.query : messageData.answer;
                          final isSentByMe = isQuery;

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
                                    isSentByMe ? 'You' : 'AI Chatbot',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ),
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
                      );
                    } else {
                      return Center(child: Text('No chat history available.'));
                    }
                  } else if (state is AIAssistanceSendQueryLoaded) {
                    return Center(child: Text('Error sending query.'));
                  } else if (state is AIAssistanceError) {
                    return Center(child: Text('An error occurred.'));
                  }
                  return SizedBox();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      textInputAction: TextInputAction.go,
                      onSubmitted: (value) {
                        _sendMessage(context);
                      },
                      decoration: InputDecoration(hintText: 'Enter message'),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      _sendMessage(context);
                    },
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
