import 'package:flutter/material.dart';

class My_Inbox extends StatefulWidget {
  My_Inbox({Key? key}) : super(key: key);

  @override
  _My_InboxState createState() => _My_InboxState();
}

class _My_InboxState extends State<My_Inbox> {
  int messages_count = 10;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFF1D1C1C)),
      home: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 40),
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
                Text("($messages_count)",
                    style: const TextStyle(
                        color: Color(0xFF322EDD),
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Poppins',
                        fontSize: 27)),
                const SizedBox(
                  width: 17,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: TextField(
                cursorColor: const Color.fromARGB(255, 245, 238, 238),
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Search',
                  labelStyle: const TextStyle(
                      color: Color.fromARGB(160, 44, 43, 43),
                      fontWeight: FontWeight.w100,
                      fontFamily: 'Poppins',
                      fontSize: 20),
                  suffixIcon: const Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Icon(Icons.search_sharp),
                  ),
                  filled: true,
                  fillColor: const Color(0xFF2E2929),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
            const Text(
              "All Chats",
              style: TextStyle(
                  color: Color.fromARGB(159, 78, 77, 77),
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Poppins',
                  fontSize: 33),
            ),
          ],
        ),
      ),
    );
  }
}
