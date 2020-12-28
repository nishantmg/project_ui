import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/models/restaurant.dart';
import 'package:food_delivery/models/restaurantMenuProduct.dart';
import 'package:food_delivery/resources/environment.dart';
import 'package:food_delivery/resources/services/RestaurantMenuProductService.dart';
import 'package:food_delivery/resources/services/RestaurantService.dart';
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
        child: RefreshIndicator(
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 8),
                      child: Text(
                        "Recommendation",
                        style: kRobotoTextStyle.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 2.5 * SizeConfig.textMultiplier,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    height: 25 * SizeConfig.heightMultiplier,
                    child: FutureBuilder(
                      builder: (context, snapshot) {
                        //print('product ko data${snapshot.data}');
                        if ((snapshot.connectionState != ConnectionState.done) &&
                            snapshot.hasData == false) {
                          return Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.green,
                            ),
                          );
                        }else if((snapshot.connectionState != ConnectionState.waiting && snapshot.hasData ==false)){
                          return Center(
                            child: Text("No product loaded"),
                          );
                        }
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              print('product is loading');
                              RestaurantMenuProduct restaurantProduct = snapshot.data[index];
                              return GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => FoodDetailScreen(
                                          product: restaurantProduct
                                      )
                                  )
                                  );
                                },
                                child: FoodCard(
                                  image: NetworkImage("$imageUrl/${restaurantProduct.product.productImage}"),
                                  name: "${restaurantProduct.product.productName}",
                                  price: "${restaurantProduct.productPrice}",
                                  restaurantName: "${restaurantProduct.restaurant.restaurantName}",
                                ),
                              );
                            });
                      },
                      future: getRestaurantProducts(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Restaurants",
                          style: kRobotoTextStyle.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 2.5 * SizeConfig.textMultiplier,
                              color: Colors.black),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "More",
                              style: kRobotoTextStyle.copyWith(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 2 * SizeConfig.textMultiplier,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      height: 190,
                      child: FutureBuilder(
                        builder: (context, snapshot) {
                          if ((snapshot.connectionState != ConnectionState.done) &&
                              snapshot.hasData == false) {
                            return Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.green,
                              ),
                            );
                          }else if(snapshot.connectionState != ConnectionState.waiting && snapshot.hasData ==false){
                            return Center(
                              child: Text("No restaurant loaded"),
                            );
                          }
                          return ListView.builder(
                            itemCount: snapshot.data.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              Restaurant restaurant = snapshot.data[index];
                              return GestureDetector(
                                onTap: (){
                                  int restaurantId = restaurant.restaurantId;
                                  String restaurantName = restaurant.restaurantName;
                                  NetworkImage restaurantImage = NetworkImage('$imageUrl/${restaurant.image}');
                                  Navigator.push(context, MaterialPageRoute(
                                      builder:(context) => RestaurantDetailScreen(restaurantName: restaurantName, restaurantImage: restaurantImage,restaurantId: restaurantId,))
                                  );
                                },
                                child: RestaurantCard(
                                  image: NetworkImage('$imageUrl/${restaurant.image}'),
                                  name: "${restaurant.restaurantName}",
                                ),
                              );
                            },
                          );
                        },
                        future: getRestaurants(),
                      )),
                ],
              ),
            ],
          ),
          onRefresh: _onRefresh,
        ),
      ),
    );
  }

  Future<Null> _onRefresh()async{
    setState(() {
    });
    await Future.delayed(Duration(seconds: 1));
    return null;
  }
}
