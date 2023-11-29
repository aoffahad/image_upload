import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoUpload extends StatefulWidget {
  const PhotoUpload({super.key});

  @override
  State<PhotoUpload> createState() => _PhotoUploadState();
}

class _PhotoUploadState extends State<PhotoUpload> {
  File? _image;

  Future getImageGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageTemporary = File(image.path);
    setState(() {
      this._image = imageTemporary;
    });
  }

  Future getImageCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;

    final imageTemporary = File(image.path);
    setState(() {
      this._image = imageTemporary;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _image != null
              ? Image.file(
                  _image!,
                  width: 200,
                  height: 250,
                  fit: BoxFit.cover,
                )
              : Image.network(
                  "https://images.unsplash.com/photo-1457449940276-e8deed18bfff?auto=format&fit=crop&q=60&w=700&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"),
          // ElevatedButton(
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: Colors.red,
          //     foregroundColor: Colors.white,
          //   ),
          //   onPressed: () => Navigator.of(context).push(
          //       MaterialPageRoute(builder: (context) => const TestPage())),
          //   child:  Text('Signin'),
          // ),
          // ElevatedButton(
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: Colors.red,
          //     foregroundColor: Colors.white,
          //   ),
          //   onPressed: () => Navigator.of(context).push(
          //       MaterialPageRoute(builder: (context) => const TestPage())),
          //   child:  Text('Signin'),
          // ),
          custombutton(
            title: "Uplaod",
            icon: Icons.image_outlined,
            onClick: getImageGallery,
          ),

          custombutton(
            title: "Camera",
            icon: Icons.image_outlined,
            onClick: getImageCamera,
          ),
        ],
      ),
    );
  }
}

Widget custombutton({
  required String title,
  required IconData icon,
  required VoidCallback onClick,
}) {
  return Container(
    width: 200,
    child: ElevatedButton(
      onPressed: onClick,
      child: Row(
        children: [Icon(icon), Text(title)],
      ),
    ),
  );
}
