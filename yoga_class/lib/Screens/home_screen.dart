import 'package:flutter/material.dart';
import 'package:yoga_class/constants.dart';
import 'package:yoga_class/rounded_button.dart';
import 'login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'homescreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int age = 30;
  bool checkedValue = false;
  int _value = 0;
  String name = "Rahul";
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser(); 
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser!;
      if (user != null) {
        loggedInUser = user;

        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text("Welcome, Yoga Class"),
        ),
        backgroundColor: Color(0XffFFBC61),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              }),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Welcome $name",
              style: kheaderTextStyle,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Text(
                "Age",
                style: kheaderTextStyle,
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  inactiveTrackColor: Color(0xffFfdead),
                  activeTrackColor: Color(0xffFfa368),
                  thumbColor: Color(0xFFf4c2c2),
                  overlayColor: Color(0xfffbceb1),
                  thumbShape: RoundSliderThumbShape(
                      enabledThumbRadius: 10.0, elevation: 10.0),
                ),
                child: Slider(
                  value: age.toDouble(),
                  min: 18.0,
                  max: 65.0,
                  onChanged: (double newValue) {
                    // print(newValue.round());
                    setState(
                      () {
                        age = newValue.round();
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  "Batch",
                  style: kheaderTextStyle,
                ),
                RadioListTile<int>(
                  title: Text(" 6 - 7 AM", style: klabelTextStyle),
                  value: 1,
                  groupValue: _value,
                  onChanged: (val) {
                    setState(() {
                      _value = val ?? 0;
                    });
                  },
                  activeColor: Colors.orange,
                ),
                RadioListTile<int>(
                  title: Text("7 - 8 AM", style: klabelTextStyle),
                  value: 2,
                  groupValue: _value,
                  onChanged: (val) {
                    setState(() {
                      _value = val ?? 0;
                    });
                  },
                  activeColor: Colors.orange,
                ),
                RadioListTile<int>(
                  title: Text("8 - 9 AM", style: klabelTextStyle),
                  value: 3,
                  groupValue: _value,
                  onChanged: (val) {
                    setState(() {
                      _value = val ?? 0;
                    });
                  },
                  activeColor: Colors.orange,
                ),
                RadioListTile<int>(
                  title: Text("5 - 6 PM", style: klabelTextStyle),
                  value: 4,
                  groupValue: _value,
                  onChanged: (val) {
                    setState(() {
                      _value = val ?? 0;
                    });
                  },
                  activeColor: Colors.orange,
                )
              ],
            ),
          ),
          RoundedButton(
            name: "Pay Fee",
            color: Color(0XffFFBC61),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
