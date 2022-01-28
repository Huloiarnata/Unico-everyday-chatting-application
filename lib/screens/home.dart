import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unico/widgets/icon.dart';
import '../services/google_sign_in.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 40, top: 100),
            child: const Text(
              "UNICO.",
              style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Poppins',
                  fontSize: 55),
            ),
          ),
          Stack(
            children: <Widget>[
              Container(
                //color: Colors.blueGrey,
                height: 350,
                width: 300,
                padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                child: Image.asset('assets/home/unico-home.png'),
              ),
              Container(
                //color: Colors.blueGrey,

                padding: const EdgeInsets.fromLTRB(30, 240, 0, 0),
                child: SizedBox(
                  height: 250,
                  width: 300,
                  child: FittedBox(
                    child: FloatingActionButton.extended(
                      heroTag: 'b1',
                      elevation: 6,
                      onPressed: () async {
                        final provider = Provider.of<GoogleSignInProvider>(
                            context,
                            listen: false);
                        provider.googleLogin();
                      },
                      backgroundColor: const Color(0xFF343131),
                      icon: const Icon(Google.google),
                      label: const Text(
                        'Continue With Google',
                        style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Poppins',
                            fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(30, 340, 0, 0),
                child: SizedBox(
                  height: 200,
                  width: 300,
                  child: FittedBox(
                    child: FloatingActionButton.extended(
                      heroTag: 'b2',
                      elevation: 6,
                      onPressed: () {
                        Navigator.pushNamed(context, '/mobile_login');
                      },
                      backgroundColor: const Color(0xFF1D41C0),
                      icon: const Icon(Icons.phone),
                      label: const Text(
                        'Continue With Mobile',
                        style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Poppins',
                            fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]);
  }
}
