import 'package:flutter/material.dart';
import 'package:food_delivery/ui/pages/food_screen.dart';
import 'package:food_delivery/ui/pages/login_screen.dart';
import 'package:food_delivery/ui/pages/main_screen.dart';
import 'package:food_delivery/ui/pages/signup_screen.dart';
import 'package:food_delivery/ui/pages/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery',
      theme: ThemeData(
        primaryColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id : (context)=> WelcomeScreen(),
        SignUpScreen.id: (context)=> SignUpScreen(),
        LoginScreen.id:(context)=> LoginScreen(),
        MainScreen.id:(context)=>MainScreen(),
        FoodScreen.id:(context)=>FoodScreen()
      },
    );
  }
}
