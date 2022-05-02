import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/elements/BigProject.dart';
import 'package:to_do_app/elements/bigCounter.dart';
import 'package:to_do_app/elements/monthDays.dart';
import 'package:to_do_app/elements/newToDo.dart';
import 'package:to_do_app/elements/toDo.dart';
import 'package:to_do_app/services/auth.dart';
import 'package:to_do_app/shared/loading.dart';

import '../../models/daySelector.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
    required this.tits,
  }) : super(key: key);

  final List<String> tits;
  static final DateTime now = DateTime.now();
  static DateFormat formatter = DateFormat('EEEE');

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _auth = AuthService();

  int selected = 1;

  //final int formatted = int.parse(formatter.format(now));
  final String formatted = HomePage.formatter.format(HomePage.now);

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> snaps = FirebaseFirestore.instance
        .collection('users')
        .doc('rHfHTVGIDxhejdWr60BrAzX6qQI2')
        .collection('todos')
        .where("timestamp",
            isEqualTo: context.watch<daySelector>().day.toString())
        .snapshots();

    void _showSettingPanel() {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 60.0,
            ),
            child: CustomForm(),
          );
        },
      );
    }

    Days days = Days(
      month: 5,
    );

    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              DateFormat('MMMM yyyy').format(context.read<daySelector>().day),
              style: TextStyle(color: Colors.black),
            ),
          ),
          leading: IconButton(
            onPressed: () {
              showDatePicker(
                context: context,
                initialDate: context.read<daySelector>().day,
                firstDate: DateTime(2022),
                lastDate: DateTime(2023),
                builder: (context, child) {
                  return Theme(
                    data: ThemeData.light().copyWith(
                      colorScheme: const ColorScheme.dark(
                        primary: Color.fromRGBO(208, 186, 255, 1),
                        onPrimary: Color.fromARGB(255, 0, 0, 0),
                        surface: Color.fromRGBO(128, 90, 208, 1),
                        onSurface: Colors.white,
                      ),
                      dialogBackgroundColor: Colors.white,
                    ),
                    child: child as Widget,
                  );
                },
              ).then((value) {
                DateTime newv =
                    DateTime.utc(value!.year, value.month, value.day);
                context.read<daySelector>().changeDay(newv);
              });
            },
            icon: Icon(Icons.calendar_month),
            color: Color.fromRGBO(128, 90, 208, 1),
          ),
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 249, 249, 249),
          actions: <Widget>[
            TextButton.icon(
              onPressed: () async {
                await _auth.SignOut();
              },
              icon: Icon(
                Icons.logout,
                color: Color.fromRGBO(128, 90, 208, 1),
              ),
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
              days,
              const SizedBox(
                height: 10,
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
                  children: const <Widget>[
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
                child: StreamBuilder<QuerySnapshot>(
                  stream: snaps,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text("errore");
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Loading();
                    }

                    final data = snapshot.requireData;

                    return ListView.builder(
                      itemCount: data.size,
                      itemBuilder: (context, index) {
                        return ToDos(
                            id: data.docs[index].id,
                            Ctitle: data.docs[index]['name'],
                            done: data.docs[index]['done']);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showSettingPanel();
          },
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
