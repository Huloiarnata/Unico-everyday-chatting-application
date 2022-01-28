import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/google_sign_in.dart';

class My_Inbox extends StatefulWidget {
  const My_Inbox({Key? key}) : super(key: key);

  @override
  _My_InboxState createState() => _My_InboxState();
}

class _My_InboxState extends State<My_Inbox> {
  int messages_count = 10;
  final List startinginbox = ['Add Mobile Number', 'Sync Contacts'];
  final List leadingicons = [Icons.mobile_friendly, Icons.cloud];
  final List trailingicons = [
    Icons.keyboard_arrow_right,
    Icons.keyboard_arrow_right
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
            const SizedBox(height: 50),
            Row(
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
                Text(" ($messages_count)",
                    style: const TextStyle(
                        color: Color(0xFF322EDD),
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Poppins',
                        fontSize: 27)),
                const SizedBox(
                  width: 26,
                ),
                PopupMenuButton(
                    color: const Color.fromARGB(255, 54, 54, 54),
                    iconSize: 37,
                    icon: const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                    itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const <Widget>[
                                Icon(Icons.person, color: Colors.white),
                                SizedBox(width: 10),
                                Text(
                                  "Profile",
                                  style: TextStyle(
                                      color: Color.fromARGB(225, 255, 255, 255),
                                      fontWeight: FontWeight.w300,
                                      fontFamily: 'Poppins',
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const <Widget>[
                                Icon(Icons.settings, color: Colors.white),
                                SizedBox(width: 10),
                                Text(
                                  "Settings",
                                  style: TextStyle(
                                      color: Color.fromARGB(225, 255, 255, 255),
                                      fontWeight: FontWeight.w300,
                                      fontFamily: 'Poppins',
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: 3,
                            onTap: () {
                              final provider =
                                  Provider.of<GoogleSignInProvider>(context,
                                      listen: false);
                              provider.logout();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const <Widget>[
                                Icon(Icons.logout, color: Colors.white),
                                SizedBox(width: 10),
                                Text(
                                  "Log Out",
                                  style: TextStyle(
                                      color: Color.fromARGB(225, 255, 255, 255),
                                      fontWeight: FontWeight.w300,
                                      fontFamily: 'Poppins',
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ]),
              ],
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
              child: ListView.builder(
                padding: const EdgeInsets.all(20),
                scrollDirection: Axis.vertical,
                itemCount: startinginbox.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {},
                    leading: Icon(
                      leadingicons[index],
                      color: const Color(0xFF699BF7),
                      size: 27,
                    ),
                    /*****TEXT******/
                    title: Text(
                      '${startinginbox[index]}',
                      style: const TextStyle(
                          color: Color.fromARGB(225, 255, 255, 255),
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Poppins',
                          fontSize: 18),
                    ),
                    trailing: Icon(
                      trailingicons[index],
                      color: const Color(0xFF699BF7),
                      size: 27,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
