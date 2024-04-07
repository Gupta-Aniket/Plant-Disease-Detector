import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'card_list.dart';

class ResultPage extends StatelessWidget {
  String pickedImage;
  List<dynamic> result;
  ResultPage({required this.pickedImage, required this.result});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xfffde8d6),
        appBar: AppBar(
          backgroundColor: Color(0xfff79651),
          title: Text("Result"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Container(
                  height: 300,
                  width: 250,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.file(
                      File(pickedImage),
                    ),
                  ),
                ),
              ),
              // CardList(
              //   nameOfDisease: result[0],
              //   confidentiality: result[0][1],
              // ),
              Expanded(
                child: Column(
                  children: result.map((item) {
                    return CardList(
                      nameOfDisease: item['label'] ?? '',
                      confidentiality: item['score'] ?? '',
                      redirectTo:
                          ('https://www.google.com/search?q=How+do+you+treat+${item['label']}+leaf'),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
