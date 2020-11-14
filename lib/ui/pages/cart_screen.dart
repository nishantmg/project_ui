import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/models/cart.dart';
import 'package:food_delivery/models/cartItem.dart';
import 'package:food_delivery/resources/services/CartService.dart';
import 'package:food_delivery/ui/widgets/SizeConfig.dart';
import 'package:food_delivery/ui/widgets/order_item.dart';

class CartScreen extends StatefulWidget {
  static String id = 'cart_screen';
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCart();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.04),
      body:SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: 50 * SizeConfig.heightMultiplier,
            child: FutureBuilder(
              builder: (context, snapshot) {
                print("Data ${snapshot.data.cartItems}");
                if (snapshot.connectionState ==
                    ConnectionState.done &&
                    snapshot.hasData != false) {
                  return ListView.builder(
                    itemCount: snapshot.data.cartItems.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      print('Cart is loading');
                      CartItem cart = snapshot.data.cartItems[index];
                      return GestureDetector(
                        onTap: (){
                          // String restaurantName = restaurant.restaurantName;
                          // NetworkImage restaurantImage = NetworkImage('$imageUrl/${restaurant.image}');
                          // Navigator.push(context, MaterialPageRoute(
                          //     builder:(context) => RestaurantDetailScreen(restaurantName: restaurantName, restaurantImage: restaurantImage))
                          // );
                        },
                        child: OrderItem(),
                      );
                    },
                  );
                }
                return Container(
                  child: Text("No Data"),
                );
              },
              future: getCart(),
            ),
          )),
        ),
    );
  }
}

