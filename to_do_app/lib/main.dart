import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/elements/BigProject.dart';
import 'package:to_do_app/elements/bigCounter.dart';
import 'package:to_do_app/elements/day.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/elements/monthDays.dart';
import 'package:to_do_app/elements/newToDo.dart';
import 'package:to_do_app/elements/toDo.dart';
import 'package:to_do_app/elements/wordss.dart';
import 'package:to_do_app/models/daySelector.dart';
import 'package:to_do_app/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/services/auth.dart';
import 'package:intl/intl.dart';
import 'models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => daySelector(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<CustomUser>.value(
      value: AuthService().user,
      initialData: CustomUser(uid: ''),
      child: const MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}

class ToDo extends StatelessWidget {
  const ToDo({Key? key}) : super(key: key);

  static List<String> tits = ["hello", "hello4", "hello3"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Wrapper(),
    );
  }
}