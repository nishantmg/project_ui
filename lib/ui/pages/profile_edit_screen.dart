import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';

class ProfileEditScreen extends StatefulWidget {
  static String id = "profile_edit_screen";
  @override
  _ProfileEditScreenState createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.4),
      key: _key,
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 95),
                        child: Text("Edit Profile",
                          style: kRoundedTextStyle.copyWith(
                              color: Colors.black
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
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
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: kInputFieldDecoration.copyWith(
                          labelText: "Email",
                          hintText: "Email"
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.phone,
                      decoration: kInputFieldDecoration.copyWith(
                          labelText: "Phone",
                          hintText: "Phone"
                      ),
                    ),
                    TextField(
                      decoration: kInputFieldDecoration.copyWith(
                          labelText: "Address",
                          hintText: "Address"
                      ),
                    ),
                    TextField(
                      obscureText: true,
                      decoration: kInputFieldDecoration.copyWith(
                          labelText: "Password",
                          hintText: "Password"
                      ),
                    ),
                    TextField(
                      obscureText: true,
                      decoration: kInputFieldDecoration.copyWith(
                          labelText: "Confirm Password",
                          hintText: "Confirm Password"
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
