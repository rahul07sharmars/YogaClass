import 'package:flutter/material.dart';
import 'package:yoga_class/Screens/home_screen.dart';
import 'package:yoga_class/rounded_button.dart';
import 'package:yoga_class/constants.dart';

class LoginScreen extends StatelessWidget {
  static String id = 'loginscreen';

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
            Header(name: "LogIn "),
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
              textAlign: TextAlign.center,
              obscureText: false,
              decoration: kTextFieldDecoration.copyWith(
                  hintText: "Enter your password"),
                  onChanged: (value) {
                password= value;
              },
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
