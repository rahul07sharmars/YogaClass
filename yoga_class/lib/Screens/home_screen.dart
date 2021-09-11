import 'package:flutter/material.dart';

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
        title: Text("Welcome, Rahul"),
        backgroundColor: Color(0XffFFBC61),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "Welcome Rahul",
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Age",
            style: TextStyle(color: Colors.black),
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
          SizedBox(
            height: 30.0,
          ),
          Text(
            "Batch",
            style: TextStyle(color: Colors.black),
          ),
          CheckboxListTile(
            title: Text(
              "6-7AM",
              style: TextStyle(color: Color(0xffB38b6d)),
            ),
            value: checkedValue,
            onChanged: (newValue) {
              setState(() {
                checkedValue = true;
                print(checkedValue);
              });
            },
            controlAffinity:
                ListTileControlAffinity.leading, //  <-- leading Checkbox
          ),CheckboxListTile(
            title: Text(
              "7-8AM",
              style: TextStyle(color: Color(0xffB38b6d)),
            ),
            value: checkedValue,
            onChanged: (newValue) {
              setState(() {
                checkedValue = true;
                print(checkedValue);
              });
            },
            controlAffinity:
                ListTileControlAffinity.leading, //  <-- leading Checkbox
          ),
        
        CheckboxListTile(
            title: Text(
              "8-9AM",
              style: TextStyle(color: Color(0xffB38b6d)),
            ),
            value: checkedValue,
            onChanged: (newValue) {
              setState(() {
                checkedValue = true;
                print(checkedValue);
              });
            },
            controlAffinity:
                ListTileControlAffinity.leading, //  <-- leading Checkbox
          )
        ,
          CheckboxListTile(
            title: Text(
              "5-6PM",
              style: TextStyle(color: Color(0xffB38b6d)),
            ),
            value: checkedValue,
            onChanged: (newValue) {
              setState(() {
                checkedValue = true;
                print(checkedValue);
              });
            },
            controlAffinity:
                ListTileControlAffinity.leading, //  <-- leading Checkbox
          )
        ],
        
      ),
    );
  }
}
