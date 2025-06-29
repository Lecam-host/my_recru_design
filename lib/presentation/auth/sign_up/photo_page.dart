import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_recru_design/presentation/widgets/take_picture_widget.dart';

class PhotoPage extends StatefulWidget {
  const PhotoPage({super.key});

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 75,
    );

    if (pickedFile != null) {
      setState(() {
        // _image = File(pickedFile.path);
      });
    }
  }

  // Future<void> _takeImage() async {
  //   final pickedFile = await ImagePicker().pickImage(
  //     source: ImageSource.camera,
  //     imageQuality: 75,
  //   );

  //   if (pickedFile != null) {
  //     setState(() {
  //       // _image = File(pickedFile.path);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
            onPressed: _pickImage,
            child: Text("Telecharger une photo"),
          ),
          Center(child: TakePictureWidget(raduis: 250)),
        ],
      ),
    );
  }
}
