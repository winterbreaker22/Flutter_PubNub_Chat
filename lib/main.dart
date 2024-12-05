// main.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/contacts_screen.dart';
import 'services/pubnub_service.dart';
import 'controllers/contact_controller.dart';
import 'package:logger/logger.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final logger = Logger();

  PubNubService.init().then((_) {
    runApp(const MyApp());
  }).catchError((error) {
    logger.e(error);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Chat',
      home: ContactsScreen(),
      initialBinding: BindingsBuilder(() {
        Get.put(ContactController());
      }),
    );
  }
}
