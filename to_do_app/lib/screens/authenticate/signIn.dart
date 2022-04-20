import 'package:flutter/material.dart';
import 'package:to_do_app/models/user.dart';
import 'package:to_do_app/services/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("SignIn"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ElevatedButton(
          onPressed: () async {
            dynamic result = await _auth.SignInAnon();
            print(result != null ? result.uid : "error");
          },
          child: Text("sign in anon"),
        ),
      ),
    );
  }
}
