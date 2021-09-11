import 'package:flutter/material.dart';
import 'Screens/welcome_screen.dart';
import 'Screens/login_screen.dart';
import 'Screens/registration_screen.dart';
import 'Screens/home_screen.dart';

void main() => runApp(YogaApp());

class YogaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light( ).copyWith(textTheme: TextTheme(bodyText1: TextStyle(color:Color(0xFFFBE9BA),), ),),
        // theme: ThemeData.dark().copyWith(
        //   textTheme:TextTheme(
        //     bodyText1:TextStyle(
        //       color: Colors.black54),),

        // ),
        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          HomeScreen.id: (context) => HomeScreen(),
        });
  }
}
