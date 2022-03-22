import 'package:flutter/material.dart';
import 'package:to_do_app/elements/BigProject.dart';
import 'package:to_do_app/elements/bigCounter.dart';
import 'package:to_do_app/elements/day.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/elements/toDo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const ToDo(),
    );
  }
}

class ToDo extends StatelessWidget {
  const ToDo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
          body: Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 50,
                ),
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20), //apply padding to all four sides
                  child: Row(
                    children: [
                      Text(
                        "To Do",
                        style: GoogleFonts.montserrat(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      ToDos(
                        Ctitle: "andare a fare la spesa",
                      ),
                      ToDos(
                        Ctitle: "finire l'app",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Color.fromRGBO(208, 186, 255, 1),
            foregroundColor: Color.fromRGBO(128, 90, 208, 1),
            child: Icon(Icons.add, size: 35,),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat),
    );
  }
}
