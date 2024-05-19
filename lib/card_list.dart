import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_farming/internal_web.dart';
import 'package:url_launcher/url_launcher.dart';

class CardList extends StatelessWidget {
  launchURL(BuildContext context, String url) async {
    try {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InternalWeb(
            redirectTo: url,
          ),
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  String redirectTo;
  double confidentiality;
  String nameOfDisease = "";
  CardList({
    required this.nameOfDisease,
    required this.confidentiality,
    required this.redirectTo,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff7a8d84),
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(15)),
          ),
          onPressed: () {
            launchURL(context, redirectTo);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      nameOfDisease,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    (confidentiality * 100).toInt().toString() + " % ",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
