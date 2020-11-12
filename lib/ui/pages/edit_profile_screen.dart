import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/ui/widgets/SizeConfig.dart';

class EditProfileScreen extends StatefulWidget {
  static String id = "edit_profile_screen";

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.4),
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
                      Text("Edit Profile",
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
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
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

