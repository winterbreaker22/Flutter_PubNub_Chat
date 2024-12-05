// widgets/message_bubble.dart

import 'package:flutter/material.dart';
import '../models/message.dart';

class MessageBubble extends StatelessWidget {
  final Message? message;

  const MessageBubble({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(message?.text ?? ''),
      subtitle: Text('Sent at: ${message?.timestamp}'),
      trailing: message?.filePath != null ? const Icon(Icons.attach_file) : null,
    );
  }
}
