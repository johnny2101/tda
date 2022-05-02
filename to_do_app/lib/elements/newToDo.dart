import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/daySelector.dart';
import 'package:to_do_app/shared/constants.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({Key? key}) : super(key: key);

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final _formKey = GlobalKey<FormState>();

  var name = '';

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users').doc('rHfHTVGIDxhejdWr60BrAzX6qQI2').collection('todos');
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
              decoration: textDecs,
              onChanged: (value) {
                name = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              }),
          Center(
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("sending data to cloud firestore")),
                  );

                  users
                      .add({'name': name, 'done': false, 'timestamp': context.read<daySelector>().day.toString()})
                      .then((value){
                        Navigator.pop(context);
                      })
                      .catchError((error) => print("error"));

                  
                }
              },
              child: Text("Submit"),
            ),
          )
        ],
      ),
    );
  }
}
