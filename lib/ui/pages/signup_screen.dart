import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';

class SignUpScreen extends StatefulWidget {
  static String id = "signup_screen";
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.6), BlendMode.srcATop),
          image: AssetImage("assets/images/background1.jpg"),
          fit: BoxFit.fill,
        )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                decoration: kInputFieldDecoration.copyWith(
                  labelText: "First Name",
                  hintText: "First Name"
                ),
              ),
              TextField(
                decoration: kInputFieldDecoration.copyWith(
                  labelText: "Last Name",
                  hintText: "Last Name"
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    color: Color(0xFF69c730),
                    child: Text(
                      "SIGN UP",
                      style: kButtonTextStyle,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, SignUpScreen.id);
                    },
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
      ),
    );
  }
}
