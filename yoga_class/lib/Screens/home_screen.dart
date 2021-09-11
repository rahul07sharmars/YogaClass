import 'package:flutter/material.dart';
import 'package:yoga_class/constants.dart';
import 'package:yoga_class/rounded_button.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'homescreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int height;
  bool checkedValue = false;
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
              "Welcome Rahul",
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
                  activeTrackColor: Color(0xffF1e1cc),
                  thumbColor: Color(0xFFEB1555),
                  overlayColor: Color(0x29EB1555),
                  thumbShape: RoundSliderThumbShape(
                      enabledThumbRadius: 12.0, elevation: 20.0),
                ),
                child: Slider(
                  value: 30.0,
                  min: 18.0,
                  max: 65.0,
                  onChanged: (double newValue) {
                    print(newValue.round());
                    setState(
                      () {
                        height = newValue.round();
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
                
                RadioListTile(
                  title: Text(" 6 - 7 AM", style: klabelTextStyle),
                  value: 1,
                  groupValue: 1,
                  onChanged: (val) {},
                  activeColor: Colors.orange,
                ),
                RadioListTile(
                  title: Text("7 - 8 AM", style: klabelTextStyle),
                  value: 1,
                  groupValue: 1,
                  onChanged: (val) {},
                  activeColor: Colors.orange,
                ),
                RadioListTile(
                  title: Text("8 - 9 AM", style: klabelTextStyle),
                  value: 1,
                  groupValue: 1,
                  onChanged: (val) {},
                  activeColor: Colors.orange,
                ),
                RadioListTile(
                  title: Text("5 - 6 PM", style: klabelTextStyle),
                  value: 1,
                  groupValue: 1,
                  onChanged: (val) {},
                  activeColor: Colors.orange,
                )
              ],
            ),
          ),
        RoundedButton(name: "Pay Fee", color: Color(0XffFFBC61), onPressed:(){},),
        ],
      ),
    );
  }
}
