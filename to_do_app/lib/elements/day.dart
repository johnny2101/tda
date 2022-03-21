import 'dart:ffi';

import 'package:flutter/material.dart';

class Day extends StatelessWidget {
  const Day({Key? key, required this.number, required this.day, this.active})
      : super(key: key);

  final int number;
  final String day;
  final bool? active;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "$number",
              style: TextStyle(
                fontSize: 20,
              ),
            ),

            Text(
              day,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
      margin: EdgeInsets.all(7.5),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: active != null ?Color.fromRGBO(208, 186, 255, 1) : Color.fromARGB(255, 196, 196, 196),
        borderRadius: BorderRadius.all(
          Radius.circular(13.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(1),
            spreadRadius:-1,
            blurRadius: 2,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
    );
  }
}

final textDec = Container(
  margin: EdgeInsets.all(7.5),
  height: 60,
  width: 60,
  decoration: BoxDecoration(
    color: Color.fromRGBO(208, 186, 255, 1),
    borderRadius: BorderRadius.all(
      Radius.circular(13.0),
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.7),
        spreadRadius: 1,
        blurRadius: 2,
        offset: Offset(0, 2), // changes position of shadow
      ),
    ],
  ),
);
