import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

void addUser() async {
  final user = FirebaseAuth.instance.currentUser;
  await FirebaseFirestore.instance
      .collection("All Users")
      .doc(user?.email)
      .set({
        "Name": user?.displayName,
        "UID": user?.uid,
        "Number": user?.phoneNumber,
        "Email": user?.email
      })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

void addPhone() async {}
