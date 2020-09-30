import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/ui/pages/cart_screen.dart';
import 'package:food_delivery/ui/pages/favorite_screen.dart';
import 'package:food_delivery/ui/pages/home_screen.dart';
import 'package:food_delivery/ui/pages/profile_screen.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';


class MainScreen extends StatefulWidget {
  static String id ="main_screen";
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

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:_scaffoldKey,
        appBar:AppBar(
          backgroundColor: Colors.black.withOpacity(0.8),
          toolbarHeight: 45,
          title: Text("Spoon",
            style: kLogoTextStyle.copyWith(
              fontSize: 45,
              color: Color(0xFF69c730),
            ),
          ),
          leading: IconButton(
            onPressed: (){
              _scaffoldKey.currentState.openDrawer();
            },
            icon: Icon(Icons.menu,
              color: Colors.white,
            ),
          ),
        ),
        drawer: Drawer(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        colorFilter: new ColorFilter.mode(
                            Colors.black.withOpacity(0.7), BlendMode.srcATop),
                        image: AssetImage("assets/images/menu.jpg"),
                        fit: BoxFit.cover
                    )
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    UserAccountsDrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      accountName: Text("Spoon",
                        style: kRoundedTextStyle.copyWith(
                          fontSize: 24,
                        ),
                      ),
                      accountEmail: Text("Spoon@gmail.com"),
                      currentAccountPicture: CircleAvatar(
                        backgroundImage: AssetImage("assets/images/avatar.png"),
                      ),
                    ),
                    Column(
                      children: [
                        ListTile(
                            leading: Icon(Icons.account_circle,
                              color: Colors.white,
                            ),
                            title: Text('Profile',
                              style: kRoundedTextStyle.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            onTap: () {

                            }
                        ),
                        ListTile(
                          leading: Icon(Icons.settings,
                            color: Colors.white,
                          ),
                          title: Text('Setting',
                            style: kRoundedTextStyle.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          onTap: () {
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.exit_to_app,
                            color: Colors.white,
                          ),
                          title: Text('Logout',
                            style: kRoundedTextStyle.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          onTap: () {
                          },
                        )
                      ],
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
            activeColor: Colors.red,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favorite'),
            activeColor: Colors.purpleAccent,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text(
              'Cart',
            ),
            activeColor: Colors.pink,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Profile'),
            activeColor: Colors.blue,
            textAlign: TextAlign.center,
          ),
        ],
      ),

    );
  }
}
