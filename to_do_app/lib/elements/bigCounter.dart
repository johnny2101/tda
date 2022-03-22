import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BigCounter extends StatelessWidget {
  const BigCounter({Key? key, required this.cont}) : super(key: key);

  final int cont;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "$cont",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w800,
            color: Color.fromRGBO(128, 90, 208, 1),
          ),
        ),
      ),
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
