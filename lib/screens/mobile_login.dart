import 'package:flutter/material.dart';

// ignore: camel_case_types
class Mobile_Login extends StatefulWidget {
  const Mobile_Login({Key? key}) : super(key: key);

  @override
  _Mobile_LoginState createState() => _Mobile_LoginState();
}

// ignore: camel_case_types
class _Mobile_LoginState extends State<Mobile_Login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFF1D1C1C)),
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(230, 27.5, 0, 0),
              child: SizedBox(
                // height: 900,
                // width: 400,
                //child: FittedBox(
                child: Image.asset('assets/mobile_login/ellipse.png'),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(40, 100, 0, 0),
              child: const Text(
                "HELLO",
                style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                    fontSize: 72),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(40, 175, 0, 0),
              child: const Text(
                "THERE.",
                style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                    fontSize: 72),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(40, 295, 0, 0),
              child: const Text(
                "Enter Your Mobile Number :",
                style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Poppins',
                    fontSize: 16),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(40, 330, 40, 0),
              child: TextField(
                keyboardType: TextInputType.number,
                maxLength: 10,
                cursorColor: const Color.fromARGB(255, 141, 140, 140),
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFF343131),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(220, 412, 0, 0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "Back To Home",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Poppins',
                      fontSize: 13),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 440, 0, 0),
              child: SizedBox(
                height: 60,
                width: 350,
                child: FittedBox(
                  child: FloatingActionButton.extended(
                    heroTag: 'b3',
                    onPressed: () {
                      Navigator.pushNamed(context, '/otp');
                    },
                    backgroundColor: const Color(0xFF1D41C0),
                    //image: AssetImage('assets/home/unico-google.png'),
                    //Image(image: AssetImage('assets/home/unico-google.png')),
                    elevation: 6,
                    label: const Text(
                      '    Login    ',
                      style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Poppins',
                          fontSize: 15),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
