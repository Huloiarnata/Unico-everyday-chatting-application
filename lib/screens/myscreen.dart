import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/google_sign_in.dart';

class Myinbox extends StatefulWidget {
  const Myinbox({Key? key}) : super(key: key);

  @override
  _MyinboxState createState() => _MyinboxState();
}

class _MyinboxState extends State<Myinbox> {
  final _user = FirebaseAuth.instance.currentUser;
  int messagesCount = 0;
  final List startinginbox = ['Add Mobile Number'];
  final List leadingicons = [Icons.mobile_friendly];
  final List trailingicons = [
    Icons.keyboard_arrow_right,
  ];
  final List name = ['Sonu', 'Arin', 'Sanchit', 'Apoorv', 'Dhurv'];
  final List icon = [
    Icons.verified_user,
    Icons.verified_user,
    Icons.verified_user,
    Icons.verified_user,
    Icons.verified_user,
    Icons.verified_user
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0)),
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Messages",
                    style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Poppins',
                        fontSize: 35),
                  ),
                  Text(" ($messagesCount)",
                      style: const TextStyle(
                          color: Color(0xFF322EDD),
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Poppins',
                          fontSize: 27)),
                  const SizedBox(
                    width: 40,
                  ),
                  IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            backgroundColor:
                                const Color.fromARGB(207, 36, 34, 34),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30))),
                            context: context,
                            builder: (context) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    leading: const Icon(
                                      Icons.person_rounded,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                    title: const Text(
                                      "Profile",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              159, 255, 255, 255),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Poppins',
                                          fontSize: 20),
                                    ),
                                    onTap: () {},
                                  ),
                                  ListTile(
                                    leading: const Icon(
                                      Icons.settings,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                    title: const Text(
                                      "Settings",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              159, 255, 255, 255),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Poppins',
                                          fontSize: 20),
                                    ),
                                    onTap: () {},
                                  ),
                                  ListTile(
                                    leading: const Icon(
                                      Icons.logout_rounded,
                                      size: 30,
                                      color: Color.fromARGB(225, 255, 0, 0),
                                    ),
                                    title: const Text(
                                      "Log Out",
                                      style: TextStyle(
                                          color: Color.fromARGB(225, 255, 0, 0),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Poppins',
                                          fontSize: 20),
                                    ),
                                    onTap: () {
                                      final provider =
                                          Provider.of<GoogleSignInProvider>(
                                              context,
                                              listen: false);
                                      provider.logout();
                                    },
                                  ),
                                ],
                              );
                            });
                      },
                      iconSize: 37,
                      icon: const Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
            Container(
              height: 75,
              padding: const EdgeInsets.all(20),
              child: TextField(
                cursorColor: const Color.fromARGB(255, 245, 238, 238),
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Search',
                  labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 131, 130, 130),
                      fontWeight: FontWeight.w100,
                      fontFamily: 'Poppins',
                      fontSize: 18),
                  suffixIcon: const Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Icon(Icons.search_sharp,
                        color: Color.fromARGB(255, 150, 149, 149), size: 22),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 54, 54, 54),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: const Text(
                "All Chats",
                style: TextStyle(
                    color: Color.fromARGB(159, 170, 169, 169),
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Poppins',
                    fontSize: 19),
              ),
            ),
            Expanded(
              child: StreamBuilder<DocumentSnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("All Users")
                      .doc(_user?.email)
                      .snapshots(),
                  builder: (context, userSnapshot) {
                    if (userSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else {
                      if (userSnapshot.hasData) {
                        final phoneData = userSnapshot.data!['Number'];
                        return ListView.builder(
                          padding: const EdgeInsets.all(20),
                          scrollDirection: Axis.vertical,
                          itemCount: (phoneData == null)
                              ? startinginbox.length
                              : name.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () {},
                              leading: Icon(
                                (phoneData == null)
                                    ? leadingicons[index]
                                    : icon[index],
                                color: const Color(0xFF699BF7),
                                size: 27,
                              ),
                              /*****TEXT******/
                              title: Text(
                                (phoneData == null)
                                    ? '${startinginbox[index]}'
                                    : '${name[index]}',
                                style: const TextStyle(
                                    color: Color.fromARGB(225, 255, 255, 255),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins',
                                    fontSize: 18),
                              ),
                              trailing: const Icon(
                                Icons.keyboard_arrow_right,
                                color: Color(0xFF699BF7),
                                size: 27,
                              ),
                            );
                          },
                        );
                      } else {
                        return const Text("Something Went Wrong !");
                      }
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
