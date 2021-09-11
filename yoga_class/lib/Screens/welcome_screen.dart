import 'package:flutter/material.dart';
import 'package:yoga_class/Screens/login_screen.dart';
import 'package:yoga_class/Screens/registration_screen.dart';

class WelcomeScreen extends StatelessWidget {
  static String id = 'welcomescreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Welcome'),
            SizedBox(
              height: 48.0,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
              child: Text('Log In'),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
