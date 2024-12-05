// services/pubnub_service.dart

import 'package:pubnub/pubnub.dart';
import 'dart:async';
import '../utils/chat_constants.dart';

class PubNubService {
  static late PubNub _pubnub;
  static late Subscription _subscription;

  static Future<void> init() async {
    _pubnub = PubNub(
      defaultKeyset: Keyset(
        publishKey: pubnubPublishKey,
        subscribeKey: pubnubSubscribeKey,
        secretKey: pubnubSecretKey,
      ),
    );
  }

  static Future<void> subscribe(String channel, Function(String message) onMessage) async {
    _subscription = _pubnub.subscribe(
      channels: {channel},
      withPresence: true,
    );
    
    _subscription.messages.listen(
      (message) {
        if (message.content is String) {
          onMessage(message.content as String); // Call your onMessage callback if the message is a String
        } else {
          print("Received non-string message: ${message.content}");
        }
      },
      onError: (error) {
        print('Error while subscribing: $error');
      },
    );
  }

  static Future<void> sendMessage(String channel, String message) async {
    await _pubnub.publish(channel, message);
  }

  static Future<void> unsubscribe() async {
    await _subscription.cancel();
  }

  static Future<void> destroy() async {
    await _subscription.dispose();
  }
}
