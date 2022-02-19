import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unico/screens/otp.dart';
import 'package:unico/services/crud_operation.dart';
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
        '/myscreen': (BuildContext context) => const Myinbox(),
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
                  addUser();
                  checkPhone();
                  return const Myinbox();
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
