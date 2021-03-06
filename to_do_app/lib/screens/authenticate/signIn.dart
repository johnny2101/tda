import 'package:flutter/material.dart';
import 'package:to_do_app/elements/day.dart';
import 'package:to_do_app/models/user.dart';
import 'package:to_do_app/services/auth.dart';
import 'package:to_do_app/shared/constants.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  const SignIn({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();

  bool loading = false;

  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Sign In"),
        actions: <Widget>[
          TextButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: Icon(Icons.person),
            label: Text("sign up"),
            style: TextButton.styleFrom(
              primary: Colors.white,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 50.0,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20.0),
              TextFormField(
                decoration: textDecs,
                validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                decoration: textDecs.copyWith(hintText: 'Password'),
                validator: (val) =>
                    val!.length < 8 ? 'Enter a password (8+ characters)' : null,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
                obscureText: true,
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() => loading = true);
                    dynamic result = await _auth.signInEmail(email, password);
                    if (result == null) {
                      setState(() {
                        error = 'wrong credentials';
                        loading = false;
                      });
                    } else {
                      //print(result.uid);
                    }
                  }
                },
                child: const Text(
                  "Sign In",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                error,
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
        // child: ElevatedButton(
        //   onPressed: () async{
        //     dynamic result = await _auth.signInAnon();
        //     if(result == null){
        //       print("error signin in");
        //     } else{
        //       print(result.uid);
        //     }
        //   },
        //   child: Text('sign in anon'),
        //),
      ),
    );
  }
}
