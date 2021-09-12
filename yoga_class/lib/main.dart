import 'package:flutter/material.dart';
import 'package:yoga_class/Screens/members_screen.dart';
import 'Screens/welcome_screen.dart';
import 'Screens/login_screen.dart';
import 'Screens/registration_screen.dart';
import 'Screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(YogaApp());
}
// void main() => runApp(YogaApp());

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
          MemberScreen.id:(context) =>MemberScreen(),
        });
  }
}
