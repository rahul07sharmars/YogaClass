import 'package:flutter/material.dart';
import 'package:yoga_class/Screens/home_screen.dart';
import 'package:yoga_class/rounded_button.dart';

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
            RoundedButton(
              name: 'Register',
              color: Colors.blueAccent,
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
