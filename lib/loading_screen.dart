import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:smart_farming/result_page.dart';
import 'package:url_launcher/url_launcher.dart';

const API_URL =
    "https://api-inference.huggingface.co/models/Diginsa/Plant-Disease-Detection-Project";
const headers = {
  "Authorization": "Bearer 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"
};

class LoadingPage extends StatelessWidget {
  String filename;

  LoadingPage({required this.filename});

  void start(BuildContext context, String filename) async {
    List<dynamic> result = await query(filename);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(
          pickedImage: filename,
          result: result,
        ),
      ),
    );
  }

  Future<List<dynamic>> query(String filename) async {
    final file = File(filename);
    final bytes = await file.readAsBytes();

    final response = await http.post(
      Uri.parse(API_URL),
      headers: headers,
      body: bytes,
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          "API request failed with status code ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    start(context, filename);
    return Scaffold(
      backgroundColor: Color(0x41434632),
      body: Center(
        child: SpinKitCircle(
          size: 100,
          color: Colors.green,
        ),
      ),
    );
  }
}
