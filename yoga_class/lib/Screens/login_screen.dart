import 'package:flutter/material.dart';
import 'package:yoga_class/Screens/home_screen.dart';
import 'package:yoga_class/rounded_button.dart';
import 'package:yoga_class/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'loginscreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email;

  late String password;
  final _auth = FirebaseAuth.instance;

  showError(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ERROR'),
            content: Text(errormessage),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Header(name: "LogIn "),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
              decoration:
                  kTextFieldDecoration.copyWith(hintText: "Enter your email"),
              onChanged: (value) {
                email = value;
              },
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              obscureText: true,
              style: TextStyle(color: Colors.black),
              decoration: kTextFieldDecoration.copyWith(
                  hintText: "Enter your password"),
              onChanged: (value) {
                password = value;
              },
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              enable: true,
              name: 'Login In',
              color: Color(0XffFFBC61),
              onPressed: () async {
                try {
                  final user = _auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  Navigator.pushNamed(context, HomeScreen.id);
                } on FirebaseAuthException catch (e) {
                  print(e.message);
                  // showError(e.message??'');
                }
              },
            ),
            // TextButton(
            //   onPressed: () {
            //     Navigator.pushNamed(context, HomeScreen.id);
            //   },
            //   child: Text('Login '),
            // ),
          ],
        ),
      ),
    );
  }
}
