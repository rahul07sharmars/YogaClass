import 'package:flutter/material.dart';
import 'package:yoga_class/Screens/home_screen.dart';

class RegistrationScreen extends StatelessWidget {
  static String id = 'registrationscreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Register Here!'),
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
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
