import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/ui/pages/food_screen.dart';

class HomeScreen extends StatefulWidget {
  static String id = "home_screen";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                        Colors.white.withOpacity(0.5), BlendMode.srcATop),
                  image: AssetImage("assets/images/background2.jpg"),
                  fit: BoxFit.cover
                )
              ),
            ),
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
                            fontSize: 25,
                            color: Colors.black
                        ),
                      ),
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
                                    Navigator.pushNamed(context, FoodScreen.id);
                                  },
                                  child: FoodItem(
                                    foodImage: AssetImage('assets/images/spaghetti.jpg'),
                                    foodName: "Spaghetti",
                                    foodPrice: "200",
                                  ),
                                ),
                                FoodItem(
                                  foodImage: AssetImage('assets/images/spaghetti.jpg'),
                                  foodName: "Spaghetti",
                                  foodPrice: "200",
                                ),
                                FoodItem(
                                  foodImage: AssetImage('assets/images/spaghetti.jpg'),
                                  foodName: "Spaghetti",
                                  foodPrice: "200",
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

class FoodItem extends StatelessWidget {
  const FoodItem({this.foodImage,this.foodName,this.foodPrice});
  final AssetImage foodImage;
  final String foodName;
  final String foodPrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Container(
            height: 158,
            width: 200,
            child: Stack(
              children:[
                Positioned(
                  top: 30,
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white
                    ),
                    height: 125,
                    width: 200,
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            children: [
                              Text(foodName,
                                style: kRoundedTextStyle.copyWith(
                                  color: Colors.black
                                ),
                              ),
                              SizedBox(width: 41,),
                              Text("Rs. $foodPrice",
                                style: kRoundedTextStyle.copyWith(
                                  color: Colors.black
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 10,)
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  child: Container(
                    height: 100,
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: foodImage,
                        fit: BoxFit.fill
                      )
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
