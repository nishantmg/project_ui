import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/ui/pages/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  static String id = "login_screen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            Column(
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
                  padding: const EdgeInsets.symmetric(vertical: 70.0,horizontal: 60.0),
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
                                labelText: "Email",
                                hintText: "Email"
                            ),
                          ),
                          TextField(
                            obscureText: true,
                            decoration: kInputFieldDecoration.copyWith(
                                labelText: "Password",
                                hintText: "Password"
                            ),
                          ),
                          SizedBox(height: 10.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("Forgot Password?",
                                style: kSloganTextStyle.copyWith(
                                    fontSize: 17,
                                    color: Color(0xFF69c730)
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 55.0,),
                      FlatButton(
                        color: Color(0xFF69c730),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 60.0),
                          child: Text(
                            "SIGN IN",
                            style: kButtonTextStyle,
                          ),
                        ),
                        onPressed: () {
                          // Navigator.pushNamed(context, SignUpScreen.id);
                        },
                      ),
                      SizedBox(height: 60.0,),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, SignUpScreen.id);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("New here?",
                              style: kSloganTextStyle.copyWith(
                                  color: Colors.white,
                                  fontSize: 18.0
                              ),
                            ),
                            Text(" Sign Up",
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
          ],

        ),
      ),
    );
  }
}
