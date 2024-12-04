import 'package:pubnub/pubnub.dart';
import 'dart:developer';

void main() async {
  var pubnub = PubNub(
    defaultKeyset:
      Keyset(
        subscribeKey: 'sub-c-fe16b864-cc14-4198-b683-e03fbde705dc', 
        publishKey: 'pub-c-30ce84a6-d16a-40ff-845d-3abf07240b14', 
        userId: const UserId('miguel_key1')
      )
  );

  var channel = "getting_started";
  var subscription = pubnub.subscribe(channels: {channel});

  subscription.messages.listen((message) {
    log(message.content);
  });
  
  for(var i=1; i<=5; i++) {
    await pubnub.publish(channel, 'Message no. $i');
    await Future.delayed(const Duration(seconds: 1));
  }

  await subscription.dispose();
}
