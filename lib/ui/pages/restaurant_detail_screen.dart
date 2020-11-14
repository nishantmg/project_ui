import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/ui/widgets/SizeConfig.dart';


class RestaurantDetailScreen extends StatefulWidget {
  static String id = "restaurant_detail_screen";
  final NetworkImage restaurantImage;
  final String restaurantName;

  const RestaurantDetailScreen({@required this.restaurantImage,@required this.restaurantName});

  @override
  _RestaurantDetailScreenState createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen> {

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container (
                  height: 25 * SizeConfig.heightMultiplier,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: widget.restaurantImage,
                        fit: BoxFit.fill,
                      )),
                ),
                Column(
                  children: [
                    Container(
                      height: 8 * SizeConfig.heightMultiplier,
                      decoration: BoxDecoration(
                          color: Color(0xFF0E3311).withOpacity(0.6)
                      ),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon:Icon(Icons.arrow_back_ios,
                              color:Colors.white,
                              size: 19.0,
                            ),
                            onPressed: (){
                              Navigator.pop(context);
                            },
                          ),
                          Text(widget.restaurantName,
                            style: kRoundedTextStyle.copyWith(
                                fontSize: 2.8 * SizeConfig.textMultiplier,
                                color: Colors.white
                            ),
                          ),
                          IconButton(
                            icon:Icon(Icons.shopping_cart,
                              color:Colors.white,
                              size: 19.0,
                            ),
                            onPressed: (){
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Container(
                child: CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 25),
                            child: Column(
                              children: [
                                Text(widget.restaurantName,
                                style: kRoundedTextStyle.copyWith(
                                  color: Colors.green
                                ),
                                )
                              ],
                            ),
                          ),
                          ListTile(
                            leading: FlutterLogo(),
                            title: Text('Birthday Cakes'),
                            trailing: Icon(Icons.arrow_right),
                          ),
                          ListTile(
                            leading: FlutterLogo(),
                            title: Text('Birthday Cakes'),
                            trailing: Icon(Icons.more_vert),
                          ),
                          ListTile(
                            leading: FlutterLogo(),
                            title: Text('Birthday Cakes'),
                            trailing: Icon(Icons.more_vert),
                          ),
                          ListTile(
                            leading: FlutterLogo(),
                            title: Text('Birthday Cakes'),
                            trailing: Icon(Icons.more_vert),
                          ),
                          ListTile(
                            leading: FlutterLogo(),
                            title: Text('Birthday Cakes'),
                            trailing: Icon(Icons.more_vert),
                          ),
                        ]
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
