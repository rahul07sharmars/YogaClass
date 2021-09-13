import 'package:flutter/material.dart';
import 'package:yoga_class/Screens/login_screen.dart';
import 'package:yoga_class/Screens/registration_screen.dart';
import 'package:yoga_class/constants.dart';
import 'package:yoga_class/rounded_button.dart';

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
            Header(name: "Welcome"),
            SizedBox(
              height: 48.0,
            ),
            
            RoundedButton(
              enable: true,
              name:'Log In', color: Color(0XffFFBC61), onPressed:() {
                Navigator.pushNamed(context, LoginScreen.id);
              },),
              
            
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              enable: true,
              name: 'Register',
              color: Color(0XffFFBC61),
              onPressed: () {
                 Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
            // TextButton(
            //   onPressed: () {
            //     Navigator.pushNamed(context, RegistrationScreen.id);
            //   },
            //   child: Text('Register'),
            // ),
          ],
        ),
      ),
    );
  }
}
