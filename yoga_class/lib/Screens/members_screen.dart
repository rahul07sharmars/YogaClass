import 'package:flutter/material.dart';
import 'package:yoga_class/constants.dart';
import 'login_screen.dart';

class MemberScreen extends StatelessWidget {
  static String id = 'memberscreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text("Welcome to Yoga Class"),
        ),
        backgroundColor: Color(0XffFFBC61),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              }),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        children: [
          Text(
            "About Yoga",
            style: kheaderTextStyle,
          ),
          Text(text, style: klabelTextStyle),
        ],
      ),
    );
  }
}
