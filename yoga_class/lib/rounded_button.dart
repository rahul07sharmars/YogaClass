import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton(
      {required this.name, required this.color, required this.onPressed});

  final String name;
  final Color color;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        child: MaterialButton(
          onPressed: () {
            onPressed();
          },
          child: Text(name),
        ),
      ),
    );
  }
}
