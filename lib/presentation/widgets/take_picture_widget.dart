import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TakePictureWidget extends StatefulWidget {
  const TakePictureWidget({super.key});

  @override
  State<TakePictureWidget> createState() => _TakePictureWidgetState();
}

class _TakePictureWidgetState extends State<TakePictureWidget> {
  XFile? _image;
  Future<void> _takeImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 75,
    );

    if (pickedFile != null) {
      setState(() {
        _image = XFile(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _takeImage,
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.shade200,
          border: Border.all(
            color: Colors.grey.shade300,
            width: 2,
            style: BorderStyle.solid,
          ),
        ),
        child: _image != null
            ? Image.file(File(_image!.path), fit: BoxFit.fill)
            : Icon(
                Icons.camera_alt_outlined,
                size: 40,
                color: Theme.of(context).colorScheme.primary,
              ),
      ),
    );
  }
}
