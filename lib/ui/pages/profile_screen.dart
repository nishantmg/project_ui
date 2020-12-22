import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/models/user.dart';
import 'package:food_delivery/resources/services/UserService.dart';
import 'package:food_delivery/ui/pages/change_password_screen.dart';
import 'package:food_delivery/ui/pages/edit_profile_screen.dart';
import 'package:food_delivery/ui/widgets/SizeConfig.dart';

class ProfileScreen extends StatefulWidget {
  static String id = "profile_screen";

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int id;
  String firstName;
  String lastName;
  String userName;
  String email;
  String mobile;
  String role;

  // @override
  // void initState() {
  //   super.initState();
  //   Map responseObj;
  //   loadUserInfo().then(
  //       (res) => {
  //         responseObj = json.decode(res.body),
  //         id = responseObj['id'],
  //         firstName = responseObj['firstName'],
  //         lastName = responseObj['lastName'],
  //         userName = responseObj['userName'],
  //         email = responseObj['email'],
  //         mobile = responseObj['mobile'],
  //         role = responseObj['role'],
  //         print(responseObj)
  //       }
  //   ).catchError((error) => print(error));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          builder: (context,snapshot){
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 25.0),
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 50.0,
                          backgroundImage: AssetImage('assets/images/avatar.png'),
                        ),
                        SizedBox(height: 2 * SizeConfig.heightMultiplier,),
                        FutureBuilder(
                            builder: (context,snapshot){
                              User user= snapshot.data;
                              return Text(
                                '${user.firstName} ${user.lastName}',
                                style: kRoundedTextStyle.copyWith(
                                    color: Colors.black,
                                    fontSize: 5 * SizeConfig.textMultiplier
                                ),
                              );
                            },
                          future: loadUserInfo(),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          onTap: (){
                            Navigator.pushNamed(context, EditProfileScreen.id);
                          },
                          // leading: Icon(Icons.settings),
                          title: Text('Account',
                            style: kRoundedTextStyle.copyWith(
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontSize: 2.5 * SizeConfig.textMultiplier
                            ),
                          ),
                          subtitle: Text('Edit Profile',
                            style: kOpenSansTextStyle.copyWith(
                                fontWeight: FontWeight.normal,
                                fontSize: 1.9 * SizeConfig.textMultiplier
                            ),
                          ),
                          trailing: Icon(Icons.account_circle),
                        ),
                        ListTile(
                          onTap: (){
                            Navigator.pushNamed(context, ChangePasswordScreen.id);
                          },
                          // leading: Icon(Icons.settings),
                          title: Text('Security',
                            style: kRoundedTextStyle.copyWith(
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontSize: 2.5 * SizeConfig.textMultiplier
                            ),
                          ),
                          subtitle: Text('Change password ',
                            style: kOpenSansTextStyle.copyWith(
                                fontWeight: FontWeight.normal,
                                fontSize: 1.9 * SizeConfig.textMultiplier
                            ),
                          ),
                          trailing: Icon(Icons.lock),
                        ),
                        ListTile(
                          // leading: Icon(Icons.help_outline),
                          title: Text('Help & Support',
                            style: kRoundedTextStyle.copyWith(
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontSize: 2.5 * SizeConfig.textMultiplier
                            ),
                          ),
                          subtitle: Text('Help center and legal support',
                            style: kOpenSansTextStyle.copyWith(
                                fontWeight: FontWeight.normal,
                                fontSize: 1.9 * SizeConfig.textMultiplier
                            ),
                          ),
                          trailing: Icon(Icons.help_outline),
                        ),
                        ListTile(
                          // leading: Icon(Icons.question_answer),
                          title: Text('FAQ',
                            style: kRoundedTextStyle.copyWith(
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontSize: 2.5 * SizeConfig.textMultiplier
                            ),
                          ),
                          subtitle: Text('Question and Answer',
                            style: kOpenSansTextStyle.copyWith(
                                fontWeight: FontWeight.normal,
                                fontSize: 1.9 * SizeConfig.textMultiplier
                            ),
                          ),
                          trailing: Icon(Icons.question_answer),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
          future: loadUserInfo(),
        ),
      ),
    );
  }
}
