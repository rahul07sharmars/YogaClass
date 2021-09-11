import 'package:flutter/material.dart';
import 'package:yoga_class/Screens/home_screen.dart';
import 'package:yoga_class/rounded_button.dart';

class RegistrationScreen extends StatelessWidget {
  static String id = 'registrationscreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Register Here!'),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              decoration: InputDecoration(
                hintStyle:TextStyle(color: Colors.grey),
                hintText: 'Enter your mail',
                contentPadding: EdgeInsets.symmetric(vertical:10.0, horizontal:20.0),
                border: OutlineInputBorder(
                 
                  borderRadius: BorderRadius.all(Radius.circular(32.0),),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:BorderSide(color: Color(0XFFFFCA6E),width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0))
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:BorderSide(color:Color(0XFFFFCA6E),width:4),
                  borderRadius: BorderRadius.all(Radius.circular(32.0),),
                )
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.grey),
                  hintText: 'Enter your password',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(32.0),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0XFFFFCA6E), width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0))),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0XFFFFCA6E), width: 4),
                    borderRadius: BorderRadius.all(
                      Radius.circular(32.0),
                    ),
                  )),


            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              name: 'Register',
              color: Color(0XffFFBC61),
              onPressed: () {
                Navigator.pushNamed(context, HomeScreen.id);
              },
            ),
            // TextButton(
            //   onPressed: () {
            //     Navigator.pushNamed(context, HomeScreen.id);
            //   },
            //   child: Text('Register'),
            // ),
          ],
        ),
      ),
    );
  }
}
