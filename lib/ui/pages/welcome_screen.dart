import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/ui/pages/login_screen.dart';
import 'package:food_delivery/ui/pages/signup_checker.dart';
import 'package:food_delivery/ui/pages/signup_screen.dart';
import 'package:food_delivery/ui/widgets/SizeConfig.dart';

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
            Text("Spoon", style: kLogoTextStyle.copyWith(
              fontSize: 15 * SizeConfig.textMultiplier
            ),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "You don't need a silver fork to have a good food",
                textAlign: TextAlign.center,
                style: kRoundedTextStyle.copyWith(
                  fontSize: 2.5 * SizeConfig.textMultiplier,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  color: Color(0xFF79d440),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 17.0),
                    child: Text(
                      "SIGN UP",
                      style: kButtonTextStyle.copyWith(
                        fontSize: 2.3 * SizeConfig.textMultiplier,
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, SignUpChecker.id);
                  },
                ),
                SizedBox(
                  width: 15.0,
                ),

                FlatButton(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 22.0),
                    child: Text(
                      "LOGIN",
                      style: kButtonTextStyle.copyWith(
                          fontSize: 2.3 * SizeConfig.textMultiplier,
                          color: Colors.black
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
