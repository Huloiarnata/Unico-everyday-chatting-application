import 'package:flutter/material.dart';

class Otp extends StatefulWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
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
                "ENTER",
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
                "OTP :",
                style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                    fontSize: 72),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(40, 290, 40, 0),
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
              padding: const EdgeInsets.fromLTRB(210, 360, 0, 0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "Wrong Number?",
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
              padding: const EdgeInsets.fromLTRB(0, 390, 0, 0),
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
                      '     Verify     ',
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
            Container(
              padding: const EdgeInsets.fromLTRB(94, 460, 0, 0),
              child: GestureDetector(
                onTap: () {},
                child: const Text(
                  "Didn't Recieve? Resend !",
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
            // Container(
            //   padding: EdgeInsets.fromLTRB(0, 500, 0, 0),
            //   child: OTPTextField(
            //     length: 4,
            //     width: MediaQuery.of(context).size.width,
            //     fieldWidth: 20,
            //     style: TextStyle(fontSize: 11),
            //     textFieldAlignment: MainAxisAlignment.spaceAround,
            //     fieldStyle: FieldStyle.underline,
            //     onCompleted: (pin) {
            //       print("Completed: " + pin);
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
