import 'package:flutter/material.dart';
import 'package:to_do_app/elements/BigProject.dart';
import 'package:to_do_app/elements/bigCounter.dart';
import 'package:to_do_app/elements/day.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/elements/toDo.dart';
import 'package:to_do_app/elements/wordss.dart';
import 'package:to_do_app/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/services/auth.dart';

import 'models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
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

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.tits,
  }) : super(key: key);

  final List<String> tits;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 249, 249, 249),
          actions: <Widget>[
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.logout),
              label: Text(""),
            ),
          ],
        ),
        body: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // const SizedBox(
              //   height: 50,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Day(
                    number: 1,
                    day: "mon",
                    active: true,
                  ),
                  Day(
                    number: 2,
                    day: "tue",
                  ),
                  Day(
                    number: 3,
                    day: "wen",
                  ),
                  Day(
                    number: 4,
                    day: "thu",
                  ),
                  Day(
                    number: 5,
                    day: "fri",
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20), //apply padding to all four sides
                  child: Row(
                    children: [
                      Text(
                        "Big Projects",
                        style: GoogleFonts.montserrat(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      BigCounter(cont: 4),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.more_horiz,
                          color: Color.fromARGB(255, 128, 90, 208),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    BigProject(name: "name", date: "date", elements: 2),
                    SizedBox(
                      width: 10,
                    ),
                    BigProject(name: "name", date: "date", elements: 2),
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "To Do",
                      style: GoogleFonts.montserrat(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: tits.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ToDos(Ctitle: tits[index]);
                    }),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Color.fromRGBO(208, 186, 255, 1),
          foregroundColor: Color.fromRGBO(128, 90, 208, 1),
          child: Icon(
            Icons.add,
            size: 35,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
