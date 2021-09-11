import 'package:flutter/material.dart';
import 'package:yoga_class/Screens/home_screen.dart';
import 'package:yoga_class/rounded_button.dart';
import 'package:yoga_class/constants.dart';

class RegistrationScreen extends StatelessWidget {
  static String id = 'registrationscreen';
  late final String name;
  late final String email;
  late final String password;
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
              onPressed: () {
                Navigator.pushNamed(context, HomeScreen.id);
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
