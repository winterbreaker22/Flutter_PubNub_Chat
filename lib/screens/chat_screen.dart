// screens/chat_screen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/chat_controller.dart';
import '../models/contact.dart';
import '../widgets/message_input.dart';
import '../widgets/message_bubble.dart';

class ChatScreen extends StatelessWidget {
  final Contact contact;

  const ChatScreen({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    final chatController = Get.put(ChatController('chat-${contact.userId}'), tag: 'chat-${contact.userId}');

    return Scaffold(
      appBar: AppBar(
        title: Text(contact.name),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: chatController.messages.length,
                itemBuilder: (context, index) {
                  return MessageBubble(message: chatController.messages[index]);
                },
              );
            }),
          ),
          MessageInput(
            onSend: (text) {
              chatController.sendMessage(text);
            },
            onFilePicked: (filePath) {
              // Handle file attachments
            },
          ),
        ],
      ),
    );
  }
}
