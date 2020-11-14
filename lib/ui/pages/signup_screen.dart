import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/resources/services/UserService.dart';
import 'package:food_delivery/ui/pages/home_screen.dart';
import 'package:food_delivery/ui/pages/login_screen.dart';
import 'package:food_delivery/ui/pages/main_screen.dart';
import 'package:food_delivery/ui/widgets/SizeConfig.dart';

class SignUpScreen extends StatefulWidget {
  static String id = "signup_screen";
  @override
  _SignUpScreenState createState() => _SignUpScreenState();

}

class _SignUpScreenState extends State<SignUpScreen> {

  final _formKey = GlobalKey<FormState>();

  String firstName;
  String lastName;
  String username;
  String email;
  String phone;
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
                    padding: const EdgeInsets.only(top:5,left: 60.0,right: 60.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: 50.0,
                          backgroundImage: AssetImage("assets/images/avatar.png"),
                        ),
                        // Column(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     TextField(
                        //       onChanged: (value){
                        //         firstName = value;
                        //       },
                        //       decoration: kInputFieldDecoration.copyWith(
                        //           labelText: "First Name",
                        //           hintText: "First Name"
                        //       ),
                        //     ),
                        //     TextField(
                        //       onChanged: (value){
                        //         lastName = value;
                        //       },
                        //       decoration: kInputFieldDecoration.copyWith(
                        //           labelText: "Last Name",
                        //           hintText: "Last Name"
                        //       ),
                        //     ),
                        //     TextField(
                        //       onChanged: (value){
                        //         username = value;
                        //       },
                        //       decoration: kInputFieldDecoration.copyWith(
                        //           labelText: "Username",
                        //           hintText: "Username"
                        //       ),
                        //     ),
                        //     TextField(
                        //       onChanged: (value){
                        //         email = value;
                        //       },
                        //       keyboardType: TextInputType.emailAddress,
                        //       decoration: kInputFieldDecoration.copyWith(
                        //           labelText: "Email",
                        //           hintText: "Email"
                        //       ),
                        //     ),
                        //     TextField(
                        //       onChanged: (value){
                        //         phone = value;
                        //       },
                        //       keyboardType: TextInputType.phone,
                        //       decoration: kInputFieldDecoration.copyWith(
                        //           labelText: "Phone",
                        //           hintText: "Phone"
                        //       ),
                        //     ),
                        //     TextField(
                        //       onChanged: (value){
                        //         password = value;
                        //       },
                        //       obscureText: true,
                        //       decoration: kInputFieldDecoration.copyWith(
                        //           labelText: "Password",
                        //           hintText: "Password"
                        //       ),
                        //     ),
                        //     TextField(
                        //       obscureText: true,
                        //       decoration: kInputFieldDecoration.copyWith(
                        //           labelText: "Confirm Password",
                        //           hintText: "Confirm Password"
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        Form(
                          key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                  onChanged: (value){
                                    firstName = value;
                                  },
                                  decoration: kInputFieldDecoration.copyWith(
                                      labelText: "First Name",
                                      hintText: "First Name"
                                  ),
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                  onChanged: (value){
                                    lastName = value;
                                  },
                                  decoration: kInputFieldDecoration.copyWith(
                                      labelText: "Last Name",
                                      hintText: "Last Name"
                                  ),
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                  onChanged: (value){
                                    username = value;
                                  },
                                  decoration: kInputFieldDecoration.copyWith(
                                      labelText: "Username",
                                      hintText: "Username"
                                  ),
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (!value.endsWith('.com')) {
                                      return 'Invalid email';
                                    }
                                    return null;
                                  },
                                  onChanged: (value){
                                    email = value;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: kInputFieldDecoration.copyWith(
                                      labelText: "Email",
                                      hintText: "Email"
                                  ),
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                  onChanged: (value){
                                    phone = value;
                                  },
                                  keyboardType: TextInputType.phone,
                                  decoration: kInputFieldDecoration.copyWith(
                                      labelText: "Phone",
                                      hintText: "Phone"
                                  ),
                                ),
                                TextFormField(
                                  validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter some text';
                                      }else if (value.length < 8) {
                                      return 'At least 8 characters';
                                    }
                                    return null;
                                  },
                                  onChanged: (value){
                                    password = value;
                                  },
                                  obscureText: true,
                                  decoration: kInputFieldDecoration.copyWith(
                                      labelText: "Password",
                                      hintText: "Password"
                                  ),
                                ),
                                TextFormField(
                                  validator: (value){
                                    if(value.isEmpty){
                                      return 'Please enter some text';
                                    }
                                    else if(value != password){
                                      return 'Password not matched';
                                    }
                                    return null;
                                  },
                                  obscureText: true,
                                  decoration: kInputFieldDecoration.copyWith(
                                      labelText: "Confirm Password",
                                      hintText: "Confirm Password"
                                  ),
                                ),
                              ],
                            )
                        ),
                        SizedBox(height: 6 * SizeConfig.heightMultiplier,),
                        FlatButton(
                          color: Color(0xFF69c730),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 45.0),
                            child: Text(
                              "SIGN UP",
                              style: kButtonTextStyle.copyWith(
                                  fontSize: 2.7 * SizeConfig.textMultiplier
                              ),
                            ),
                          ),
                          onPressed: () {
                            if(_formKey.currentState.validate()){
                              var map = new Map<String,dynamic>();
                              map['firstName'] = firstName;
                              map['lastName'] = lastName;
                              map['userName'] = username;
                              map['email'] = email;
                              map['phone'] = phone;
                              map['password'] = password;
                              signUpUser(map);
                              Navigator.pushNamed(context, MainScreen.id);
                            }
                          },
                        ),
                        SizedBox(height:5 * SizeConfig.heightMultiplier),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, LoginScreen.id);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("I have",
                                style: kRoundedTextStyle.copyWith(
                                    color: Colors.white,
                                    fontSize: 2.6 * SizeConfig.textMultiplier
                                ),
                              ),
                              Text(" an account",
                                style: kRoundedTextStyle.copyWith(
                                    color: Color(0xFF69c730),
                                    fontSize: 2.6 * SizeConfig.textMultiplier
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height:5 * SizeConfig.heightMultiplier),
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


