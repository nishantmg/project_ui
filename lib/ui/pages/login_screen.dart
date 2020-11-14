import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/resources/services/HttpCommon.dart';
import 'package:food_delivery/resources/services/UserService.dart';
import 'package:food_delivery/ui/pages/main_screen.dart';
import 'package:food_delivery/ui/pages/signup_screen.dart';
import 'package:food_delivery/ui/widgets/SizeConfig.dart';
import 'package:http/http.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginScreen extends StatefulWidget {
  static String id = "login_screen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final storage = new FlutterSecureStorage();

  String userName;
  String password;

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
                            style: kRoundedTextStyle.copyWith(
                                color: Colors.white,
                                fontSize: 3.2 * SizeConfig.textMultiplier
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
                              onChanged: (value) => {
                                userName = value
                              },
                              decoration: kInputFieldDecoration.copyWith(
                                  labelText: "Username",
                                  hintText: "Username"
                              ),
                            ),
                            TextField(
                              onChanged: (value) => {
                                password = value
                              },
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
                                  style: kRoundedTextStyle.copyWith(
                                      fontSize: 2.4 * SizeConfig.textMultiplier,
                                      color: Color(0xFF69c730)
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 7.5 * SizeConfig.heightMultiplier,),
                        FlatButton(
                          color: Color(0xFF69c730),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 45.0),
                            child: Text(
                              "SIGN IN",
                              style: kButtonTextStyle.copyWith(
                                  fontSize: 2.7 * SizeConfig.textMultiplier
                              ),
                            ),
                          ),
                          onPressed: () async {
                            Map parsedData;
                            var map = new Map();
                            map['username'] = userName;
                            map['password'] = password;
                            await loginUser(map).then(
                                    (dynamic res) => {
                                      if(res.statusCode == 400){
                                        // final storage = new FlutterSecureStorage();
                                      }else if(res.statusCode == 200) {
                                        parsedData = json.decode(res.body),
                                        print(parsedData['jwtToken']),
                                        storage.write(key: 'token', value: parsedData['jwtToken']),
                                        httpClient.addHeader('Authorization', parsedData['jwtToken']),
                                        Navigator.pushNamed(context, MainScreen.id)
                                      }
                            }).catchError((err) => print(err));
                          },
                        ),
                        SizedBox(height: 7 * SizeConfig.heightMultiplier),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, SignUpScreen.id);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("New here?",
                                style: kRoundedTextStyle.copyWith(
                                    color: Colors.white,
                                    fontSize: 2.6 * SizeConfig.textMultiplier
                                ),
                              ),
                              Text(" Sign Up",
                                style: kRoundedTextStyle.copyWith(
                                    color: Color(0xFF69c730),
                                    fontSize: 2.6 * SizeConfig.textMultiplier
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
            )
          ],
        ),
      ),
    );
  }
}
