import 'package:flutter/material.dart';
import 'package:to_do_app/models/daySelector.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class Day extends StatefulWidget {
  Day({
    Key? key,
    required this.number,
    required this.active,
    required this.timestamp,
  }) : super(key: key);

  final int number;
  final DateTime timestamp;
  bool active;

  @override
  State<Day> createState() => _DayState();
}

class _DayState extends State<Day> {
  void ToInactive() {
    setState(() {
      widget.active = false;
    });
  }

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
              "${widget.number}",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              DateFormat('EEEE').format(widget.timestamp).substring(0,3),
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
      margin: EdgeInsets.all(9),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: context.watch<daySelector>().day == widget.timestamp
            ? Color.fromRGBO(208, 186, 255, 1)
            : Color.fromARGB(255, 226, 226, 226),
        borderRadius: BorderRadius.all(
          Radius.circular(13.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(1),
            spreadRadius: -1,
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
