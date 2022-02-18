import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:async/async.dart';

StreamController? streamController;

@override
void dispose() {
  streamController?.close();
  streamController = null;
}

Future<Stream> getStream() async {
  final user = FirebaseAuth.instance.currentUser;
  Stream s1 =
      LazyStream(() async => await FirebaseAuth.instance.authStateChanges());
  Stream s2 = LazyStream(() async => await FirebaseFirestore.instance
      .collection('All Users')
      .doc(user?.email)
      .snapshots());
  return StreamGroup.merge([s1, s2]).asBroadcastStream();
}
