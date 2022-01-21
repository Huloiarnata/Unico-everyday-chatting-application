import 'package:flutter/material.dart';
import 'package:unico/widgets/icon.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //text
        Container(
          padding: const EdgeInsets.fromLTRB(40, 100, 0, 0),
          child: const Text(
            "UNICO.",
            style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins',
                fontSize: 55),
          ),
        ),
        //image
        Container(
          padding: const EdgeInsets.fromLTRB(40, 180, 60, 0),
          child: SizedBox(
            height: 300,
            width: 400,
            child: FittedBox(
              child: Image.asset('assets/home/unico-home.png'),
            ),
          ),
        ),
        //row(logo,continue with google)
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 17, 17, 17).withOpacity(0.3),
                spreadRadius: 7,
                blurRadius: 7,
                offset: const Offset(3, 5),
              ),
            ],
          ),
          padding: const EdgeInsets.fromLTRB(30, 410, 0, 0),
          child: SizedBox(
            height: 250,
            width: 300,
            child: FittedBox(
              child: FloatingActionButton.extended(
                heroTag: 'b1',
                elevation: 6,
                onPressed: () {
                  Navigator.pushNamed(context, '/myscreen');
                  // Respond to button press
                },
                backgroundColor: const Color(0xFF343131),

                icon: const Icon(Google.google),
                //image: AssetImage('assets/home/unico-google.png'),
                //Image(image: AssetImage('assets/home/unico-google.png')),
                label: const Text(
                  'Continue With Google',
                  style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Poppins',
                      fontSize: 15),
                ),
              ),
            ),
          ),
        ), //cont
        //row(icon,continue with mobile)
        Container(
          padding: const EdgeInsets.fromLTRB(30, 490, 0, 0),
          child: SizedBox(
            height: 250,
            width: 300,
            child: FittedBox(
              child: FloatingActionButton.extended(
                heroTag: 'b2',
                elevation: 6,
                onPressed: () {
                  Navigator.pushNamed(
                      context, '/mobile_login'); // Respond to button press
                },
                backgroundColor: const Color(0xFF1D41C0),
                icon: const Icon(Icons.phone),
                label: const Text(
                  'Continue With Mobile',
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
    );
  }
}
