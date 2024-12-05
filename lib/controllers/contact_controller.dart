// controllers/contact_controller.dart

import 'package:get/get.dart';
import '../models/contact.dart';

class ContactController extends GetxController {
  var contacts = <Contact>[
    Contact(name: 'Alice', userId: 'user1'),
    Contact(name: 'Bob', userId: 'user2'),
    Contact(name: 'Charlie', userId: 'user3'),
  ].obs;

  void fetchContacts() {
    // Fetch contacts from an API or other sources if needed
  }
}
