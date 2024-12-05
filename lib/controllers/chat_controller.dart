// controllers/chat_controller.dart

import 'package:get/get.dart';
import '../models/message.dart';
import '../services/pubnub_service.dart';
import '../utils/chat_constants.dart';

class ChatController extends GetxController {
  var messages = <Message>[].obs;
  final String channel;

  ChatController(this.channel);

  @override
  void onInit() {
    super.onInit();
    _subscribeToChannel();
  }

  void _subscribeToChannel() {
    PubNubService.subscribe(channel, _onMessageReceived);
  }

  void _onMessageReceived(String messageText) {
    final message = Message(
      senderId: "otherUser",
      text: messageText,
      timestamp: DateTime.now(),
      isSent: false,
    );
    messages.add(message);
  }

  void sendMessage(String messageText) {
    final message = Message(
      senderId: currentUserId,
      text: messageText,
      timestamp: DateTime.now(),
      isSent: true,
    );
    messages.add(message);
    PubNubService.sendMessage(channel, messageText);
  }

  @override
  void onClose() {
    PubNubService.unsubscribe();
    super.onClose();
  }
}
