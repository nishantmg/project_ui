import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/ui/pages/food_detail_screen.dart';
import 'package:food_delivery/ui/pages/restaurant_detail_screen.dart';
import 'package:food_delivery/ui/widgets/SizeConfig.dart';
import 'package:food_delivery/ui/widgets/food_card.dart';
import 'package:food_delivery/ui/widgets/restaurant_card.dart';

class HomeScreen extends StatefulWidget {
  static String id = "home_screen";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.08),
      body: SafeArea(
        child: Stack(
          children: [
            // Container(
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //         colorFilter: new ColorFilter.mode(
            //             Colors.black.withOpacity(0.3), BlendMode.srcATop),
            //       image: AssetImage("assets/images/background2.jpg"),
            //       fit: BoxFit.cover
            //     )
            //   ),
            // ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child:Padding(
                      padding: const EdgeInsets.symmetric(horizontal:12.0,vertical: 8),
                      child: Text("Recommendation",
                        style: kRobotoTextStyle.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 2.5 * SizeConfig.textMultiplier,
                            color: Colors.black
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height:25 * SizeConfig.heightMultiplier,
                    child:CustomScrollView(
                      scrollDirection: Axis.horizontal,
                      slivers: [
                        SliverList(
                          delegate: SliverChildListDelegate(
                              [
                                GestureDetector(
                                  onTap: (){
                                    Navigator.pushNamed(context, FoodDetailScreen.id);
                                  },
                                  child: FoodCard(
                                    image: AssetImage('assets/images/spaghetti.jpg'),
                                    name: "Spaghetti",
                                    price: "200",
                                  ),
                                ),
                                FoodCard(
                                  image: AssetImage('assets/images/spaghetti.jpg'),
                                  name: "Spaghetti",
                                  price: "200",
                                ),
                                FoodCard(
                                  image: AssetImage('assets/images/spaghetti.jpg'),
                                  name: "Spaghetti",
                                  price: "200",
                                ),
                              ]
                          ),
                        )
                      ],
                    )
                    ,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Restaurants",
                          style: kRobotoTextStyle.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 2.5 * SizeConfig.textMultiplier,
                              color: Colors.black
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                          },
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text("More",
                              style: kRobotoTextStyle.copyWith(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 2 * SizeConfig.textMultiplier,
                                  color: Colors.black
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height:190,
                    child:CustomScrollView(
                      scrollDirection: Axis.horizontal,
                      slivers: [
                        SliverList(
                          delegate: SliverChildListDelegate(
                              [
                                GestureDetector(
                                  onTap: (){
                                    Navigator.pushNamed(context, RestaurantDetailScreen.id);
                                  },
                                  child: RestaurantCard(
                                    image: AssetImage('assets/images/baishnab.jpeg'),
                                    name: "Baishnab Sweets",

                                  ),
                                ),
                                RestaurantCard(
                                  image: AssetImage('assets/images/black_forest.png'),
                                  name: "Black Forest",
                                ),
                                RestaurantCard(
                                  image: AssetImage('assets/images/munch_time.png'),
                                  name: "Munch Time Cafe",
                                ),
                              ]
                          ),
                        )
                      ],
                    )
                    ,
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

