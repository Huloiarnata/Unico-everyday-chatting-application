// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Database {
  final _user = FirebaseAuth.instance.currentUser;
  void addUser() async {
    await FirebaseFirestore.instance
        .collection("All Users")
        .doc(_user?.email)
        .set({
          "Name": _user?.displayName,
          "UID": _user?.uid,
          "Number": _user?.phoneNumber,
          "Email": _user?.email
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
    await FirebaseFirestore.instance
        .collection("All Chats")
        .doc(_user?.email)
        .collection("All Contacts")
        .add({"name": "yolo"});
  }
}
