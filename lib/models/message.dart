// models/message.dart

class Message {
  final String senderId;
  final String text;
  final DateTime timestamp;
  final bool isSent;
  final String? filePath;

  Message({
    required this.senderId,
    required this.text,
    required this.timestamp,
    required this.isSent,
    this.filePath,
  });
}
