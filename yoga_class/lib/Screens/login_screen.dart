import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yoga_class/Screens/home_screen.dart';
import 'package:yoga_class/rounded_button.dart';
import 'package:yoga_class/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yoga_class/database.dart';
import 'members_screen.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'loginscreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email;

  late String password;
  final _auth = FirebaseAuth.instance;
  bool subscription = false;
  late DateTime registrationDate;
  bool isFetching = false;
  // @override
  // void initState() {
  //   super.initState();
  //   checksubscription();
  //   setState(() {
  //     print(isFetching);
  //   });
  // }

  void checksubscription() async {
    print("heelo");
    try {
      final currentuser = _auth.currentUser!;
      if (currentuser != null) {
        registrationDate =
            await DataBaseManager().getCurrentUserDate(currentuser.uid);
        showError(registrationDate.toString());
        print("registrationDate $registrationDate");
        // var month = DateTime(registrationDate);
        if (registrationDate.year != DateTime.now().year ||
            registrationDate.month != DateTime.now().month) {
          subscription = false;
          print(subscription);
          await DataBaseManager().updateDate("01-01-1900", currentuser.uid);
        } else {
          subscription = true;
          print(subscription);
        }
        setState(() {
          isFetching = true;
        });
        // checkboxstate = true;
        // _value = await DataBaseManager().getCurrentUserBatch(currentuser.uid);
        // print('checkboxstate $checkboxstate');
        // print('_value $_value');

        // String month = "";
        // String year = "";
        // var i = 0;
        // for (i = 0; registrationDate[i] != '/'; i++)
        //   month += registrationDate[i];

        // for (var i = registrationDate.length; registrationDate[i] != '/'; i--)
        //   year += registrationDate[i];

      }
    } on FirebaseFirestore catch (e) {
      print(e);
    }
  }

  showError(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ERROR'),
            content: Text(errormessage),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    print("User has signout");
                  },
                  child: Text('OK'))
            ],
          );
        });
  }

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
              style: TextStyle(color: Colors.black),
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
              obscureText: true,
              style: TextStyle(color: Colors.black),
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
              enable: true,
              name: 'Login In',
              color: Color(0XffFFBC61),
              onPressed: () async {
                try {
                  final user = await _auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  if (user != null) {
                    checksubscription();
                    print(subscription);
                    if (subscription)
                      Navigator.pushNamed(context, MemberScreen.id);
                    else
                      Navigator.pushNamed(context, HomeScreen.id);
                  }
                } on FirebaseAuthException catch (e) {
                  print(e.message);
                  showError(
                      e.message ?? "Either Email or \n  Password is wrong");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
