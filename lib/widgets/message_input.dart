// widgets/message_input.dart

import 'package:flutter/material.dart';
import 'attachment_widget.dart';

class MessageInput extends StatelessWidget {
  final Function(String) onSend;
  final Function(String) onFilePicked;

  const MessageInput({super.key, required this.onSend, required this.onFilePicked});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          AttachmentWidget(onFilePicked: onFilePicked),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(hintText: 'Type a message'),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              String text = controller.text;
              if (text.isNotEmpty) {
                onSend(text);
                controller.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
