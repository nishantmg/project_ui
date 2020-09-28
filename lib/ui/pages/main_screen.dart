import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/ui/pages/home_screen.dart';
import 'package:food_delivery/ui/pages/login_screen.dart';
import 'package:food_delivery/ui/pages/signup_screen.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  static String id ="main_screen";
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List _pageOptions = [
    HomeScreen(),
    LoginScreen(),
    SignUpScreen()
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:_scaffoldKey,
        appBar:AppBar(
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
                            Colors.black.withOpacity(0.6), BlendMode.srcATop),
                        image: AssetImage("assets/images/background2.jpg"),
                        fit: BoxFit.cover
                    )
                ),
              ),
              Column(
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    accountName: Text("Spoon",
                      style: kTextStyle.copyWith(
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
                            style: kTextStyle.copyWith(
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
                          style: kTextStyle.copyWith(
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
                          style: kTextStyle.copyWith(
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
            ],
          ),

        ),
        body: _pageOptions[_currentIndex],
        bottomNavigationBar: TitledBottomNavigationBar(
            activeColor: Colors.blue,
            inactiveColor: Color(0xFF69c730),
            reverse: true,
            currentIndex: 0, // Use this to update the Bar giving a position
            onTap: (index){
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              TitledNavigationBarItem(title: Text('Home'), icon: Icons.home),
              TitledNavigationBarItem(title: Text('Search'), icon: Icons.search),
              TitledNavigationBarItem(title: Text('Bag'), icon: Icons.card_travel),
              TitledNavigationBarItem(title: Text('Orders'), icon: Icons.shopping_cart),
              TitledNavigationBarItem(title: Text('Profile'), icon: Icons.person_outline),
            ]
        )
    );
  }
}
