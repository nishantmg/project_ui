import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/resources/services/UserService.dart';
import 'package:food_delivery/ui/pages/employee_sign_up_screen.dart';
import 'package:food_delivery/ui/pages/login_screen.dart';
import 'package:food_delivery/ui/pages/main_screen.dart';
import 'package:food_delivery/ui/pages/merchant_signup_screen.dart';
import 'package:food_delivery/ui/pages/user_signup_screen.dart';
import 'package:food_delivery/ui/widgets/SizeConfig.dart';

class SignUpChecker extends StatefulWidget {
  static String id = "signup_checker_screen";

  @override
  _SignUpCheckerState createState() => _SignUpCheckerState();
}

class _SignUpCheckerState extends State<SignUpChecker> {
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  FlatButton(
                    color: Color(0xFF69c730),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 45.0),
                      child: Text(
                        "Sign Up as User",
                        style: kButtonTextStyle.copyWith(
                            fontSize: 2.7 * SizeConfig.textMultiplier
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, UserSignUpScreen.id);
                    },
                  ),
                  FlatButton(
                    color: Color(0xFF69c730),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 45.0),
                      child: Text(
                        "Sign Up as Merchant",
                        style: kButtonTextStyle.copyWith(
                            fontSize: 2.7 * SizeConfig.textMultiplier
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, MerchantSignUpScreen.id);
                    },
                  ),
                  FlatButton(
                    color: Color(0xFF69c730),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 45.0),
                      child: Text(
                        "Sign Up as Employee",
                        style: kButtonTextStyle.copyWith(
                            fontSize: 2.7 * SizeConfig.textMultiplier
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, EmployeeSignUpScreen.id);
                    },
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
