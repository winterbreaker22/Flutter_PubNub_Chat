// widgets/file_picker_widget.dart

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class FilePickerWidget extends StatelessWidget {
  final Function(String filePath) onFilePicked;

  const FilePickerWidget({super.key, required this.onFilePicked});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.attach_file),
      onPressed: () async {
        FilePickerResult? result = await FilePicker.platform.pickFiles();

        if (result != null) {
          String filePath = result.files.single.path!;
          onFilePicked(filePath);  // Pass the file path to the parent widget
        }
      },
    );
  }
}
