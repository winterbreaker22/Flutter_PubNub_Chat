// screens/contacts_screen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/contact_controller.dart';
import '../screens/chat_screen.dart';

class ContactsScreen extends StatelessWidget {
  ContactsScreen({super.key});

  final ContactController contactController = Get.put(ContactController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contacts')),
      body: Obx(() {
        return ListView.builder(
          itemCount: contactController.contacts.length,
          itemBuilder: (context, index) {
            final contact = contactController.contacts[index];
            return ListTile(
              title: Text(contact.name),
              onTap: () {
                Get.to(ChatScreen(contact: contact));
              },
            );
          },
        );
      }),
    );
  }
}
