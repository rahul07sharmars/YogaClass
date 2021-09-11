import 'package:flutter/material.dart';
import 'package:yoga_class/Screens/home_screen.dart';
import 'package:yoga_class/rounded_button.dart';
import 'package:yoga_class/constants.dart';

class LoginScreen extends StatelessWidget {
  static String id = 'loginscreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Login Page'),
            SizedBox(
              height: 48.0,
            ),
            TextField(
               textAlign: TextAlign.center,
              decoration:
                  kTextFieldDecoration.copyWith(hintText: "Enter your email"),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              decoration:
                  kTextFieldDecoration.copyWith(hintText: "Enter your password"),
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              name: 'Login In',
              color: Color(0XffFFBC61),
              onPressed: () {
                Navigator.pushNamed(context, HomeScreen.id);
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
