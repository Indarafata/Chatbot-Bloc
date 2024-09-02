import 'package:chatbot_bloc/bloc/chatbot_bloc.dart';
import 'package:chatbot_bloc/bloc/chatbot_event.dart';
import 'package:chatbot_bloc/bloc/chatbot_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatbotScreen extends StatelessWidget {
  ChatbotScreen({super.key});

  final TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Chatbot"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<ChatbotBloc, ChatbotState>(
                builder: (context, state) {
                  if (state is ChatbotMessageSent) {
                    return ListView.builder(
                      itemCount: state.bubbleChatCount,
                      itemBuilder: (context, index) {
                        if (index % 2 == 0) {
                          return bubbleMsg(state.chat[index]);
                        } else {
                          return bubbleChatbot(state.chat[index]);
                        }
                      },
                    );
                  } else if (state is ChatbotError) {
                    return Center(child: Text(state.message));
                  }
                  return const Center(child: Text('No messages yet.'));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: inputController,
                      decoration: InputDecoration(
                        hintText: "Type a message",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    icon: const Icon(Icons.send),
                    color: Colors.blue,
                    onPressed: () {
                      final message = inputController.text;
                      if (message.isNotEmpty) {
                        context
                            .read<ChatbotBloc>()
                            .add(SendMessageEvent(message));
                        inputController.clear();
                      }
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

  Widget bubbleMsg(String message) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        child: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget bubbleChatbot(String response) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Text(
          response,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
