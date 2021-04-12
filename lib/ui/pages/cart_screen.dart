import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/models/cartItem.dart';
import 'package:food_delivery/resources/services/CartService.dart';
import 'package:food_delivery/ui/pages/email.dart';
import 'package:food_delivery/ui/pages/order_screen.dart';
import 'package:food_delivery/ui/widgets/SizeConfig.dart';
import 'package:food_delivery/ui/widgets/cart_item_card.dart';


class CartScreen extends StatefulWidget {
  static String id = 'cart_screen';
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black.withOpacity(0.04),
        body: RefreshIndicator(
          child: SafeArea(
            child: StreamBuilder(
              stream: getCart(),
              builder: (context, snapshot) {
                if ((snapshot.connectionState != ConnectionState.done) &&
                    snapshot.hasData == false) {
                  print('data xaina${snapshot.connectionState}');
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.green,
                    ),
                  );
                }else if(snapshot.connectionState != ConnectionState.waiting && snapshot.hasData ==false){
                  return Center(
                    child: Text("Cart is empty"),
                  );
                }
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data.cartItems.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          print('Cart is loading');
                          print(snapshot.data);
                          CartItem cart = snapshot.data.cartItems[index];
                          return Dismissible(
                              key: Key(index.toString()),
                              onDismissed: (direction) {
                                setState(() async {
                                  await deleteCartItem(
                                      cart.cartId, cart.cartItemId);
                                });
                              },
                              child: CartItemCard(
                                cart: cart,
                              ));
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FlatButton(
                        color: Color(0xFF69c730),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 45.0),
                          child: Text(
                            "PROCEED",
                            style: kButtonTextStyle.copyWith(
                                fontSize: 2.7 * SizeConfig.textMultiplier
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, OrderScreen.id);
                          // Navigator.pushNamed(context, Email.id);

                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          onRefresh: _onRefresh,
        ));
  }

  Future<Null> _onRefresh() async {
    setState(() {});
    await Future.delayed(Duration(seconds: 1));
    return null;
  }



}
