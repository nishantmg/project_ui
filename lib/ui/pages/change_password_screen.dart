import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/ui/widgets/SizeConfig.dart';

class ChangePasswordScreen extends StatefulWidget {
  static String id = "change_password_screen";
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child:Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 50,
                    color: Colors.white,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon:Icon(Icons.arrow_back_ios,
                          color:Colors.black,
                          size: 20.0,
                        ),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),
                      Text("Change Password",
                        style: kRoundedTextStyle.copyWith(
                            fontSize: 2.8 * SizeConfig.textMultiplier,
                            color: Colors.black
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextField(
                      obscureText: true,
                      decoration: kEditProfileInputFieldDecoration.copyWith(
                          labelText: "Old Password",
                          hintText: "Old Password"
                      ),
                    ),
                    TextField(
                      obscureText: true,
                      decoration: kEditProfileInputFieldDecoration.copyWith(
                          labelText: "New Password",
                          hintText: "New Password"
                      ),
                    ),
                    TextField(
                      obscureText: true,
                      decoration: kEditProfileInputFieldDecoration.copyWith(
                          labelText: "Confirm New Password",
                          hintText: "Confirm New Password"
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FlatButton(
                        onPressed: (){

                        },
                        color: Colors.red,
                        child: Text("Cancel",
                          style: kRoundedTextStyle.copyWith(
                              color: Colors.white,
                              fontSize: 2.8 * SizeConfig.textMultiplier
                          ),
                        ),
                      ),
                    ),
                    FlatButton(
                      onPressed: (){

                      },
                      color: Colors.lightGreen,
                      child: Text("Save",
                        style: kRoundedTextStyle.copyWith(
                            color: Colors.white,
                            fontSize: 2.8 * SizeConfig.textMultiplier
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
