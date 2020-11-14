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
                      builder: (context, productData) {
                        print(productData.connectionState);
                        if (productData.connectionState == ConnectionState.done &&
                            productData.hasData != false) {
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                print('product is loading');
                                RestaurantMenuProduct restaurantProduct = productData.data[index];
                              return GestureDetector(
                                onTap: (){
                                  // NetworkImage productImage = NetworkImage('$imageUrl/${restaurantProduct.product.productImage}');
                                  // String restaurantName = restaurantProduct.restaurant.restaurantName;
                                  // String productName = restaurantProduct.product.productName;
                                  // String productPrice = restaurantProduct.productPrice.toString();
                                  // String productDescription = restaurantProduct.product.description;
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
                        }
                        return Container();
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
                          if (snapshot.connectionState ==
                                  ConnectionState.done &&
                              snapshot.hasData != false) {
                            return ListView.builder(
                              itemCount: snapshot.data.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                print('Restaurant is loading');
                                Restaurant restaurant = snapshot.data[index];
                                return GestureDetector(
                                  onTap: (){
                                    String restaurantName = restaurant.restaurantName;
                                    NetworkImage restaurantImage = NetworkImage('$imageUrl/${restaurant.image}');
                                    Navigator.push(context, MaterialPageRoute(
                                        builder:(context) => RestaurantDetailScreen(restaurantName: restaurantName, restaurantImage: restaurantImage))
                                    );
                                  },
                                  child: RestaurantCard(
                                    image: NetworkImage('$imageUrl/${restaurant.image}'),
                                    name: "${restaurant.restaurantName}",
                                  ),
                                );
                              },
                            );
                          }
                          return Container();
                        },
                        future: getRestaurants(),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
