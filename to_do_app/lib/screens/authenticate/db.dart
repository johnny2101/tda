import 'package:cloud_firestore/cloud_firestore.dart';

void UpdateDone(String id, bool check) {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  users
      .doc(id)
      .update({'check': !check})
      .then((value) {})
      .catchError((error) => print("error"));

  print("hello");
}

void RemoveToDo(String id, bool check) {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  users.doc(id).delete();

  print("hello");
}
