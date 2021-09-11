import 'package:flutter/material.dart';
import 'package:yoga_class/Screens/home_screen.dart';

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
            TextField(),
            SizedBox(
              height: 48.0,
            ),
            TextField(),
            SizedBox(
              height: 48.0,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, HomeScreen.id);
              },
              child: Text('Login '),
            ),
          ],
        ),
      ),
    );
  }
}
