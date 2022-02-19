// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
}

void checkPhone() async {
  await FirebaseFirestore.instance
      .collection("All Users")
      .doc(_user?.email)
      .get()
      .then((DocumentSnapshot documentsnapshot) {
    Map<String, dynamic> userData =
        documentsnapshot.data()! as Map<String, dynamic>;
    if (documentsnapshot.exists) {
      print('Document data: ${documentsnapshot.data()}');
      if (userData['Number'] != null) {
        print("Not Null");
      } else {
        print("Null");
      }
    } else {
      print('Document does not exist on the database');
    }
  });
}
