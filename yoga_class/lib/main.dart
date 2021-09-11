import 'package:flutter/material.dart';
import 'Screens/welcome_screen.dart';

void main() => runApp(YogaApp());

class YogaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme:TextTheme(
          bodyText1:TextStyle(
            color: Colors.black54),),
      
      ),
      initialRoute: WelcomeScreen.id,
      routes:{
        WelcomeScreen.id:(context)=>WelcomeScreen(),
      }
    );
  }
}
