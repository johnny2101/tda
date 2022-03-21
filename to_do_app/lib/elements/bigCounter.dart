import 'package:flutter/material.dart';

class BigCounter extends StatelessWidget {
  const BigCounter({Key? key, required this.cont}) : super(key: key);

  final int cont;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("$cont")),
      height: 18,
      width: 18,
      margin: EdgeInsets.only(left: 4),
      decoration: BoxDecoration(
        color: Color.fromRGBO(208, 186, 255, 1),
        borderRadius: BorderRadius.all(
          Radius.circular(4.0),
        ),
      ),
    );
  }
}
