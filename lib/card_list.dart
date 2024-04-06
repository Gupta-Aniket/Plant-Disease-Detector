import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardList extends StatelessWidget {
  double confidentiality;
  String nameOfDisease = "";
  CardList({
    required this.nameOfDisease,
    required this.confidentiality,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xff7a8d84),
            borderRadius: BorderRadius.circular(10),
          ),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 4,
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
                  Expanded(
                    flex: 1,
                    child: Text(
                      (confidentiality * 100).toInt().toString() + " % ",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
