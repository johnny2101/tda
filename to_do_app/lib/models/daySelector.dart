import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class daySelector with ChangeNotifier{
  DateTime _day = DateTime.utc(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  DateTime get day => _day;

  void changeDay(DateTime d){
    _day = d;
    print(_day);
    notifyListeners();
  }
}