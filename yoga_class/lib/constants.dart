import 'package:flutter/material.dart';

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
