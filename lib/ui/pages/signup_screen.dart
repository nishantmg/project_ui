import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/ui/pages/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  static String id = "signup_screen";
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.6), BlendMode.srcATop),
                image: AssetImage("assets/images/background1.jpg"),
                fit: BoxFit.cover,
              )),
            ),

            SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0,left:10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.arrow_back_ios,
                            color:Colors.white,
                            size: 20.0,
                          ),
                          Text("Back",
                            style: kSloganTextStyle.copyWith(
                                color: Colors.white
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:5,left: 60.0,right: 60.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: 50.0,
                          backgroundImage: AssetImage("assets/images/avatar.png"),
                        ),
                        Column(
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
                            TextField(
                              decoration: kInputFieldDecoration.copyWith(
                                  labelText: "Email",
                                  hintText: "Email"
                              ),
                            ),
                            TextField(
                              decoration: kInputFieldDecoration.copyWith(
                                  labelText: "Phone",
                                  hintText: "Phone"
                              ),
                            ),
                            TextField(
                              decoration: kInputFieldDecoration.copyWith(
                                  labelText: "Password",
                                  hintText: "Password"
                              ),
                            ),
                            TextField(
                              decoration: kInputFieldDecoration.copyWith(
                                  labelText: "Confirm Password",
                                  hintText: "Confirm Password"
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30.0,),
                        FlatButton(
                          color: Color(0xFF69c730),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 60.0),
                            child: Text(
                              "SIGN UP",
                              style: kButtonTextStyle,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, SignUpScreen.id);
                          },
                        ),
                        SizedBox(height:30.0),
                        GestureDetector(
                          onTap: (){
                            print('demo');
                            Navigator.pushNamed(context, LoginScreen.id);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("I have",
                                style: kSloganTextStyle.copyWith(
                                    color: Colors.white,
                                    fontSize: 18.0
                                ),
                              ),
                              Text(" an account",
                                style: kSloganTextStyle.copyWith(
                                    color: Color(0xFF69c730),
                                    fontSize: 18.0
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],

        ),
      ),
    );
  }
}

