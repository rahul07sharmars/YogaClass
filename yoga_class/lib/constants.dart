import 'package:flutter/material.dart';

const klabelTextStyle = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.w300,
  color: Color(0xffB38b6d),
);

const kheaderTextStyle = TextStyle(
  fontSize: 35,
  fontWeight: FontWeight.w800,
  color: Color(0xffB38b6d),
);

const kTextFieldDecoration = InputDecoration(
  hintStyle: TextStyle(color: Colors.grey),
  //hintText: 'Enter your password',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(32.0),
    ),
  ),
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0XFFFFCA6E), width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0))),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0XFFFFCA6E), width: 4),
    borderRadius: BorderRadius.all(
      Radius.circular(32.0),
    ),
  ),
);
String text =
    " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed efficitur magna dui, ut fend odio ut lorem pulvinar, sit amet sodales massa efficitur. Suspendisse eget felis vel purus convallis varius. Aliquam ullamcorper ipsum odio, a facilisis lorem venenatis ut.";
