import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';

class Converter {
  String to64BitString(String pathToImage) {
    File imageFile = File(pathToImage);
    String base64Image = base64Encode(imageFile.readAsBytesSync());
    return base64Image;
  }
}
