// widgets/attachment_widget.dart

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class AttachmentWidget extends StatelessWidget {
  final Function(String filePath) onFilePicked;

  const AttachmentWidget({super.key, required this.onFilePicked});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.attach_file),
      onPressed: () async {
        FilePickerResult? result = await FilePicker.platform.pickFiles();

        if (result != null) {
          String? filePath = result.files.single.path!;
          onFilePicked(filePath);  // Pass the file path to the parent widget
        }
      },
    );
  }
}
