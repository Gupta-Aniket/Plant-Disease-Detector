import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:smart_farming/loading_screen.dart';
import 'package:smart_farming/result_page.dart';

const API_URL =
    "https://api-inference.huggingface.co/models/Diginsa/Plant-Disease-Detection-Project";
const headers = {
  "Authorization": "Bearer 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"
};

class FrontPage extends StatelessWidget {
  FrontPage({Key? key}) : super(key: key);

  void _pickImage(BuildContext context, bool choice) async {
    File? _imageFile;
    ImagePicker _picker = ImagePicker();
    final XFile? image;
    if (choice == true)
      image = await _picker.pickImage(source: ImageSource.gallery);
    else {
      image = await _picker.pickImage(source: ImageSource.camera);
      // XFile? img = image.scaleD
      // TODO: Resize images got from camera, as they are too good and we dont need that kind of image data, the app will work on less good images as well
    }
    if (image == null) return;
    String path = (image.path);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoadingPage(filename: path),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black12,
          title: Text("Plant Disease Finder"),
          centerTitle: true,
        ),
        backgroundColor: Color(0xFFf3c4a2),
        body: Column(
          children: [
            Image.asset(
              "assets/images/background.png",
              height: 700,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        _pickImage(context, false);
                        //false : camera
                      },
                      child: Text(
                        "Camera",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      // TODO : Style both buttons using constats.dart
                      onPressed: () {
                        _pickImage(context, true);
                        //true : gallery
                      },
                      child: Text(
                        "Gallery",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
