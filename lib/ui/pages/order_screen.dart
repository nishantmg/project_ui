import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/models/cartItem.dart';
import 'package:food_delivery/resources/services/CartService.dart';
import 'package:food_delivery/resources/services/OrderService.dart';
import 'package:food_delivery/ui/pages/map_screen.dart';
import 'package:food_delivery/ui/widgets/SizeConfig.dart';
import 'package:food_delivery/ui/widgets/notification.util.dart';

class OrderScreen extends StatefulWidget {
  static String id = 'order_screen';
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {

  final _formKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  String address;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  height: 8 * SizeConfig.heightMultiplier,
                  decoration: BoxDecoration(
                      color: Color(0xFF0E3311).withOpacity(0.3)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon:Icon(Icons.arrow_back_ios,
                          color:Colors.black,
                          size: 19.0,
                        ),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),
                      Flexible(
                        child: Text("Checkout",
                          overflow: TextOverflow.ellipsis,
                          style: kRoundedTextStyle.copyWith(
                              fontSize: 2.8 * SizeConfig.textMultiplier,
                              color: Colors.black
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                StreamBuilder(
                  stream: getCart(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done &&
                        snapshot.hasData == false) {
                      return Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.green,
                        ),
                      );
                    }
                    return Column(
                      children: [
                        ListTile(
                          title: Text('Subtotal',
                            style: kRoundedTextStyle.copyWith(
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontSize: 2.5 * SizeConfig.textMultiplier
                            ),
                          ),
                          trailing: Text(
                            '${snapshot.data.quantity.toString()} items',
                            style: kRoundedTextStyle.copyWith(
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontSize: 2.5 * SizeConfig.textMultiplier
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text('Total Amount',
                            style: kRoundedTextStyle.copyWith(
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontSize: 2.5 * SizeConfig.textMultiplier
                            ),
                          ),
                          trailing: Text(
                            'Rs. ${snapshot.data.totalAmount.toString()}',
                            style: kRoundedTextStyle.copyWith(
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontSize: 2.5 * SizeConfig.textMultiplier
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 18),
                              child: Text('Location',
                                style: kRoundedTextStyle.copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                    fontSize: 2.5 * SizeConfig.textMultiplier
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                // Position position = LocationService().getCurrentLocation();
                                // List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude,position.longitude);
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>MapScreen()));
                              },
                              child:Form(
                                  key: _formKey,
                                  child:Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 18),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Please enter a correct address';
                                        }
                                        return null;
                                      },
                                      onChanged: (value) => {
                                        address = value.trim()
                                      },
                                      decoration: kInputFieldDecoration.copyWith(
                                          hintText: "Eg. BishalChowk,Bharatpur-11",
                                          labelStyle: kRoundedTextStyle.copyWith(
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black,
                                              fontSize: 2.5 * SizeConfig.textMultiplier
                                          )
                                      ),
                                    ),
                                  )
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FlatButton(
                            color: Color(0xFF69c730),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 45.0),
                              child: Text(
                                "CHECKOUT",
                                style: kButtonTextStyle.copyWith(
                                    fontSize: 2.7 * SizeConfig.textMultiplier
                                ),
                              ),
                            ),
                            onPressed: ()  {
                              postOrder(snapshot.data.cartId, address);
                              if(_formKey.currentState.validate()){
                                _key.currentState.showSnackBar(
                                    MessageBox.showMessage("Order added")
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
