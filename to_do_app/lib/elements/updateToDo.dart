import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/shared/constants.dart';

class UpdateForm extends StatefulWidget {
  final String id;
  String name;
  UpdateForm({Key? key, required this.id, required this.name})
      : super(key: key);

  @override
  State<UpdateForm> createState() => _UpdateFormState();
}

class _UpdateFormState extends State<UpdateForm> {
  final _formKey = GlobalKey<FormState>();

  var name = '';

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
              initialValue: widget.name,
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

                  users.doc('rHfHTVGIDxhejdWr60BrAzX6qQI2').collection('todos').doc(widget.id).update({'name': name}).then((value) {
                    Navigator.pop(context);
                  }).catchError((error) => print("error"));
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
