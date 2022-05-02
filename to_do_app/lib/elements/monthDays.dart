import 'package:flutter/material.dart';
import 'package:to_do_app/elements/day.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/daySelector.dart';
import 'package:intl/intl.dart';

class Days extends StatefulWidget {
  int month;
  Days({Key? key, required this.month}) : super(key: key);

  @override
  State<Days> createState() => _DaysState();
}

class _DaysState extends State<Days> {
  void changeMonth(int m) {
    setState(() {
      widget.month = m;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    int count = getMonthDays(context.read<daySelector>().day.month);

    List<Day> days = [];
    

    for (int i = 1; i <= count; i++) {
      days.add(Day(number: i, active: false, timestamp: DateTime.utc(2022, context.read<daySelector>().day.month, i),));

    }

    return SizedBox(
      height: 78,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: count,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              context.read<daySelector>().changeDay(days[index].timestamp);
            },
            child: days[index],
          );
        },
      ),
    );
  }
}

int getMonthDays(int m) {
  if (m == 11 || m == 6 || m == 4 || m == 9) {
    return 30;
  } else if (m == 2) {
    return 28;
  } else {
    return 31;
  }
}
