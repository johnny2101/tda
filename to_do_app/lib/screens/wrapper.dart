import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/main.dart';
import 'package:to_do_app/screens/authenticate/authenticate.dart';
import 'package:to_do_app/screens/home/home.dart';

import '../models/user.dart';


class Wrapper extends StatelessWidget {
  const Wrapper({ Key? key }) : super(key: key);
  static List<String> tits = ["hello", "hello4", "hello3"];
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<CustomUser>(context);
    print(user.uid);
    //return either home or authenticate widget
    if(user.uid == '0'){
      return Authenticate();
    } else {
      return HomePage(tits: tits);
    }
  }
}