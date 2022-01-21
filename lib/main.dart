import 'package:flutter/material.dart';
import 'package:unico/screens/otp.dart';
import 'screens/home.dart';
import 'package:unico/screens/mobile_login.dart';
import 'screens/myscreen.dart';

void main() => runApp(const Unico());

// ignore: camel_case_types
class Unico extends StatefulWidget {
  const Unico({Key? key}) : super(key: key);

  @override
  _UnicoState createState() => _UnicoState();
}

class _UnicoState extends State<Unico> {
  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/mobile_login': (BuildContext context) => const Mobile_Login(),
        '/otp': (BuildContext context) => Otp(),
        '/myscreen': (BuildContext context) => My_Inbox(),
      },
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFF1D1C1C)),
      home: const Scaffold(body: Home()),
      debugShowCheckedModeBanner: false,
    );
  }
}
