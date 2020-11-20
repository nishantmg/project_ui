import 'package:flutter/material.dart';
import 'package:food_delivery/ui/pages/cart_screen.dart';
import 'package:food_delivery/ui/pages/change_password_screen.dart';
import 'package:food_delivery/ui/pages/food_detail_screen.dart';
import 'package:food_delivery/ui/pages/food_list_screen.dart';
import 'package:food_delivery/ui/pages/home_screen.dart';
import 'package:food_delivery/ui/pages/login_screen.dart';
import 'package:food_delivery/ui/pages/main_screen.dart';
import 'package:food_delivery/ui/pages/edit_profile_screen.dart';
import 'package:food_delivery/ui/pages/restaurant_detail_screen.dart';
import 'package:food_delivery/ui/pages/signup_screen.dart';
import 'package:food_delivery/ui/pages/welcome_screen.dart';
import 'package:food_delivery/ui/widgets/SizeConfig.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              title: 'Food Delivery',
              theme: ThemeData(
                primaryColor: Colors.black,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              initialRoute: WelcomeScreen.id,
              routes: {
                HomeScreen.id:(context)=>HomeScreen(),
                WelcomeScreen.id : (context)=> WelcomeScreen(),
                SignUpScreen.id: (context)=> SignUpScreen(),
                LoginScreen.id:(context)=> LoginScreen(),
                MainScreen.id:(context)=>MainScreen(),
                FoodDetailScreen.id:(context)=>FoodDetailScreen(),
                CartScreen.id:(context)=>CartScreen(),
                RestaurantDetailScreen.id:(context)=> RestaurantDetailScreen(),
                EditProfileScreen.id:(context)=>EditProfileScreen(),
                ChangePasswordScreen.id:(context)=>ChangePasswordScreen(),
                FoodListScreen.id:(context)=>FoodListScreen()
              },
            );
          },
        );
      },
    );


  }
}
