import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/ui/pages/cart_screen.dart';
import 'package:food_delivery/ui/pages/home_screen.dart';
import 'package:food_delivery/ui/pages/order_history_screen.dart';
import 'package:food_delivery/ui/pages/profile_screen.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:food_delivery/ui/widgets/SizeConfig.dart';

class MerchantMainScreen extends StatefulWidget {
  static String id = "merchant_main_screen";

  @override
  _MerchantMainScreenState createState() => _MerchantMainScreenState();
}

class _MerchantMainScreenState extends State<MerchantMainScreen> {
  int _selectedIndex = 0;
  final List _pageOptions = [
    HomeScreen(),
    ProfileScreen()
  ];
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white.withOpacity(0.7),
        toolbarHeight: 45,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
          child: Text(
            "Spoon",
            style: kLogoTextStyle.copyWith(
              fontSize: 5 * SizeConfig.textMultiplier,
              color: Color(0xFF69c730),
            ),
          ),
        ),

      ),
      body: _pageOptions[_selectedIndex],
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedIndex,
        showElevation: true,
        itemCornerRadius: 25,
        curve: Curves.easeInBack,
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: Colors.lightGreen,
            inactiveColor: Colors.black,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.history),
            title: Text('Order Log'),
            activeColor: Colors.lightGreen,
            inactiveColor: Colors.black,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text(
              'Cart',
            ),
            activeColor: Colors.lightGreen,
            inactiveColor: Colors.black,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Profile'),
            activeColor: Colors.lightGreen,
            inactiveColor: Colors.black,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
