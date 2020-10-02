import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/ui/pages/cart_screen.dart';
import 'package:food_delivery/ui/pages/favorite_screen.dart';
import 'package:food_delivery/ui/pages/home_screen.dart';
import 'package:food_delivery/ui/pages/profile_screen.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:food_delivery/ui/widgets/SizeConfig.dart';

class MainScreen extends StatefulWidget {
  static String id = "main_screen";
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List _pageOptions = [
    HomeScreen(),
    FavoriteScreen(),
    CartScreen(),
    ProfileScreen()
  ];

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.7),
        toolbarHeight: 45,
        title: Text(
          "Spoon",
          style: kLogoTextStyle.copyWith(
            fontSize: 5 * SizeConfig.textMultiplier,
            color: Color(0xFF69c730),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
          icon: Icon(
            Icons.menu,
            color: Color(0xFF69c730),
          ),
        ),
      ),
      drawer: Drawer(
        child: Stack(
          children: [
            Container(
              color: Color(0xFF69c730),
            ),
            // Container(
            //   decoration: BoxDecoration(
            //       image: DecorationImage(
            //           colorFilter: new ColorFilter.mode(
            //               Colors.black.withOpacity(0.7), BlendMode.srcATop),
            //           image: AssetImage("assets/images/menu.jpg"),
            //           fit: BoxFit.cover)),
            // ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: UserAccountsDrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      accountName: Text(
                        "Spoon",
                        style: kRoundedTextStyle.copyWith(
                          color: Colors.white,
                          fontSize: 2.7 * SizeConfig.textMultiplier,
                        ),
                      ),
                      accountEmail: Text("Spoon@gmail.com",
                        style: kOpenSansTextStyle.copyWith(
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          fontSize: 2.3 * SizeConfig.textMultiplier
                        ),
                      ),
                      currentAccountPicture: CircleAvatar(
                        backgroundImage: AssetImage("assets/images/avatar.png"),
                      ),
                    ),
                  ),
                  SizedBox(height:5 * SizeConfig.heightMultiplier,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      children: [
                        ListTile(
                            leading: Icon(
                              Icons.account_circle,
                              color: Colors.white,
                            ),
                            title: Text(
                              'Profile',
                              style: kOpenSansTextStyle.copyWith(
                                fontSize: 2.7 * SizeConfig.textMultiplier,
                                color: Colors.white,
                              ),
                            ),
                            onTap: () {}),
                        ListTile(
                          leading: Icon(
                            Icons.settings,
                            color: Colors.white,
                          ),
                          title: Text(
                            'Setting',
                            style: kOpenSansTextStyle.copyWith(
                              fontSize: 2.7 * SizeConfig.textMultiplier,
                              color: Colors.white,
                            ),
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.exit_to_app,
                            color: Colors.white,
                          ),
                          title: Text(
                            'Logout',
                            style: kOpenSansTextStyle.copyWith(
                              fontSize: 2.7 * SizeConfig.textMultiplier,
                              color: Colors.white,
                            ),
                          ),
                          onTap: () {},
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
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
            icon: Icon(Icons.favorite),
            title: Text('Favorite'),
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
