// main.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/contacts_screen.dart';
import 'services/pubnub_service.dart';
import 'controllers/contact_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PubNubService.init();
  runApp(const MyApp());
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
