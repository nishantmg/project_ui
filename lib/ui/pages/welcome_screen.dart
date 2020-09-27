import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.srcATop),
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.fill,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Spoon", style: kLogoTextStyle),
            Text(
              "You don't need a silver fork to have a good food",
              textAlign: TextAlign.center,
              style: kSloganTextStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  color: Color(0xFF79d440),
                  child: Text(
                    "SIGN UP",
                    style: kButtonTextStyle,
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  width: 15.0,
                ),
                FlatButton(
                  color: Colors.white,
                  child: Text(
                    "SIGN IN",
                    style: kButtonTextStyle,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
