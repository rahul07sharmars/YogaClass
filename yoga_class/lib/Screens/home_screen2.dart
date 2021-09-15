import 'package:flutter/material.dart';
import 'package:yoga_class/Screens/members_screen.dart';
import 'package:yoga_class/constants.dart';
import 'package:yoga_class/database2.dart';
import 'package:yoga_class/rounded_button.dart';
import 'login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class HomeScreen2 extends StatefulWidget {
  static String id = "homescreen2";

  @override
  _HomeScreen2State createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  late int age = 30;
  bool checkedValue = false;
  int _value = 0;
  late String name = "<Name>";
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;
  // DateTime now = DateTime.now();
  // final DateTime dt =
  //     DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  // String dt = DateFormat.yMd().format(
  //   DateTime.now(),
  // );
  DateTime dt = DateTime.now();
  bool checkboxstate = false;
  late DateTime registrationDate;
  bool isFetching = false;
  // Colrs color=Color();

  // var dt = DateTime.now();
  // var newFormat = DateFormat("yy-MM-dd");
  @override
  void initState() {
    super.initState();
    getCurrentUser();
    // getCurrentUserData();
    // checksubscription();
    getUserName();
    setState(() {
      print("regirationDate $registrationDate");
    });
  }

  void getCurrentUser() {
    try {
      final currentuser = _auth.currentUser!;
      if (currentuser != null) {
        loggedInUser = currentuser;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  // void getCurrentUserData() async {
  //   try {
  //     final currentuser = _auth.currentUser!;
  //     if (currentuser != null) {
  //       loggedInUser = currentuser;
  //       final data =
  //           await DataBaseManager().getCurrentUserData(currentuser.uid);
  //       if (data != null) {
  //         registrationDate = data.get('date');
  //         name = data.get('name');
  //         _value = data.get('batch');
  //         print(name);
  //         print(_value);
  //         // print(registrationDate);
  //       }

  //       setState(() {});
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  void getUserName() async {
    try {
      final currentuser = _auth.currentUser!;
      if (currentuser != null) {
        name = await DataBaseManager2().getCurrentUserName(currentuser.uid);
        print(name);
      }
      setState(() {
        isFetching = true;
      });
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                dt.toString(),
                style: klabelTextStyle,
              ),
            ],
          ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.baseline,
                children: [
                  Text(
                    age.toString(),
                    style: klabelTextStyle,
                  ),
                  Text(
                    "  years",
                    style: klabelTextStyle,
                  ),
                ],
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
          Column(
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
          SizedBox(
            height: 30.0,
          ),
          Row(
            children: [
              Checkbox(
                value: checkboxstate,
                onChanged: (val) {
                  setState(() {
                    checkboxstate = val!;
                  });
                },
              ),
              //CompletePayment()
              //work here as stated in problem statement

              Text(
                'Fee Paid',
                style: klabelTextStyle,
              )
            ],
          ),
          RoundedButton(
            name: "Become Member",
            enable: checkboxstate && _value > 0,
            color: Color(0XffFFBC61),
            onPressed: () async {
              try {
                final user = _auth.currentUser!;
                if (user != null) {
                  await DataBaseManager2().createData(dt, _value, user.uid);
                  Navigator.pushNamed(context, MemberScreen.id);
                }
              } on FirebaseAuthException catch (e) {
                print(e.message);
              }
            },
          ),
        ],
      ),
    );
  }
}
