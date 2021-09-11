import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yoga_class/Screens/home_screen.dart';
import 'package:yoga_class/rounded_button.dart';
import 'package:yoga_class/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatelessWidget {
  static String id = 'registrationscreen';
  late final String name;
  late final String email;
  late final String password;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Header(name: "Register"),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              decoration:
                  kTextFieldDecoration.copyWith(hintText: "Enter your name"),
              onChanged: (value) {
                name = value;
              },
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              textAlign: TextAlign.center,
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
              obscureText: false,
              textAlign: TextAlign.center,
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
              name: 'Register',
              color: Color(0XffFFBC61),
              onPressed: ()  async {
                //Implement registration functionality.
                // print(email);
                // print(password);
                try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                  if (newUser != null) {
                    Navigator.pushNamed(context, HomeScreen.id);
                  }
                } catch (e) {
                  print(e);
                }
              },
            ),
            // TextButton(
            //   onPressed: () {
            //     Navigator.pushNamed(context, HomeScreen.id);
            //   },
            //   child: Text('Register'),
            // ),
          ],
        ),
      ),
    );
  }
}
