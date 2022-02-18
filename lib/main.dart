import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unico/screens/otp.dart';
import 'package:unico/services/AllUsers_Add.dart';
import 'package:unico/services/google_sign_in.dart';
import 'screens/home.dart';
import 'package:unico/screens/mobile_login.dart';
import 'screens/myscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Unico());
}

// ignore: camel_case_types
class Unico extends StatefulWidget {
  const Unico({Key? key}) : super(key: key);

  @override
  _UnicoState createState() => _UnicoState();
}

class _UnicoState extends State<Unico> {
  @override
  Widget build(BuildContext context) {
    //double height = MediaQuery.of(context).size.height;
    //double width = MediaQuery.of(context).size.width;
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/mobile_login': (BuildContext context) => const Mobile_Login(),
        '/otp': (BuildContext context) => const Otp(),
        '/myscreen': (BuildContext context) => const My_Inbox(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0)),
      home: Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
          child: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                Provider.of<GoogleSignInProvider>(context, listen: false);

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child: CircularProgressIndicator(
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Color.fromARGB(255, 64, 22, 218)),
                  ));
                } else if (snapshot.hasData) {
                  final user = FirebaseAuth.instance.currentUser;
                  addUser();
                  return const My_Inbox();
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Something went wrong'));
                } else {
                  return const Home();
                }
              }),
        ),
      ),
    );
  }
}
