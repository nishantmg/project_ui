import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';

class ProfileScreen extends StatefulWidget {
  static String id = "profile_screen";
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 40.0),
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage('assets/images/avatar.png'),
                  ),
                  SizedBox(height: 10.0,),
                  Text(
                    'Spoon',
                    style: kTextStyle.copyWith(
                      color: Colors.black,
                      fontSize: 35
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5.0),
              child: Column(
                children: <Widget>[
                  Card(
                    elevation: 4.0,
                    child: ListTile(
                      onTap: (){

                      },
                      leading: Icon(Icons.settings),
                      title: Text('Setting'),
                      subtitle: Text('Privacy and logout'),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),
                  ),
                  Card(
                    elevation: 4.0,
                    child: ListTile(
                      leading: Icon(Icons.help_outline),
                      title: Text('Help & Support'),
                      subtitle: Text('Help center and legal support'),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),
                  ),
                  Card(
                    elevation: 4.0,
                    child: ListTile(
                      leading: Icon(Icons.question_answer),
                      title: Text('FAQ'),
                      subtitle: Text('Question and Answer'),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
