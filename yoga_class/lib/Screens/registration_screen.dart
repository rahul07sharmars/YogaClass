import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yoga_class/Screens/login_screen.dart';
import 'package:yoga_class/database.dart';
import 'package:yoga_class/rounded_button.dart';
import 'package:yoga_class/constants.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registrationscreen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late String name;

  late String email;

  late String gender;

  late String password;

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding:  EdgeInsets.symmetric(horizontal: 24.0),
        children: [
           Header(name: "Register"),
          SizedBox(
            height: 48.0,
          ),
          TextField(
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
            decoration:
                kTextFieldDecoration.copyWith(hintText: "Enter your name"),
            onChanged: (value) {
              name = value;
              print(name);
            },
          ),
          SizedBox(
            height: 48.0,
          ),
          TextField(
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
            decoration:
                kTextFieldDecoration.copyWith(hintText: "Enter your gender"),
            onChanged: (value) {
              gender = value;
              print(gender);
            },
          ),
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
              print(email);
            },
          ),
          SizedBox(
            height: 48.0,
          ),
          TextField(
            obscureText: true,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
            decoration:
                kTextFieldDecoration.copyWith(hintText: "Enter your password"),
            onChanged: (value) {
              password = value;
              print(password);
            },
          ),
          SizedBox(
            height: 48.0,
          ),
          RoundedButton(
            name: 'Register',
            color: Color(0XffFFBC61),
            onPressed: () async {
              //Implement registration functionality.
              // print(email);
              // print(password);
              try {
                final newUser = await _auth.createUserWithEmailAndPassword(
                    email: email, password: password);
                if (newUser != null) {
                  await DataBaseManager()
                      .createUserData(name, gender, newUser.user!.uid);

                  Navigator.pushNamed(context, LoginScreen.id);
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
      // body: Padding(
      //   padding: EdgeInsets.symmetric(horizontal: 24.0),
      //   child: Column(
      //     ma
        
      //   ),
      // ),
    );
  }
}
