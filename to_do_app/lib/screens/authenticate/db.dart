import 'package:cloud_firestore/cloud_firestore.dart';

void UpdateDone(String id, bool check) {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  users
      .doc('KsZ1GZ0AvUsX54JMKvoX')
      .collection('todos')
      .doc(id)
      .update({'done': !check})
      .then((value) {})
      .catchError((error) => print("error"));

  print("hello");
}

void RemoveToDo(String id, bool check) {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  users.doc('rHfHTVGIDxhejdWr60BrAzX6qQI2').collection('todos').doc(id).delete();

  print("hello");
}
