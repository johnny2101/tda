import 'package:flutter/material.dart';

class BigProject extends StatelessWidget {
  const BigProject(
      {Key? key,
      required this.name,
      required this.date,
      required this.elements})
      : super(key: key);

  final String name;
  final String date;
  final int elements;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: 170,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(232, 221, 255, 1),
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
        /* boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(1),
            spreadRadius: -1,
            blurRadius: 2,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ], */
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 37,
              width: 37,
              child: const Icon(
                Icons.favorite,
                color: Color.fromRGBO(128, 90, 208, 1),
              ),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(208, 186, 255, 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
            ),
            Text(
              name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(80, 0, 249, 1),
              ),
            ),
            Text(
              "entro il $date",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 30),
            Text("$elements elementi",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                )),
          ],
        ),
      ),
    );
  }
}
