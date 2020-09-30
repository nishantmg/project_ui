import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_delivery/constants.dart';

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
      body:SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              OrderItem(),
              OrderItem(),
              OrderItem(),
              OrderItem()
            ],
          ),
        ),
      ),
    );
  }
}

class OrderItem extends StatelessWidget {
  const OrderItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: Stack(
        children: [
          Container(
            height: 125,
            width: 400,
          ),
          Positioned(
            left: 50,
            child: Card(
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 50,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:12.0,left:8.0,bottom: 5.0),
                          child: Text("Spaghetti",
                            style: kRobotoTextStyle.copyWith(
                              color: Colors.black
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:8,top:8.0,bottom:41),
                          child: Text("Rs.200",
                            style: kRobotoTextStyle.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.normal
                            ),
                          ),
                        )
                      ],
                    ),
                  ),//Naming and pricing
                  Padding(
                    padding: const EdgeInsets.only(top:50),
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: (){

                          },
                          child: Container(
                              margin: EdgeInsets.only(right: 10.0),
                              width:30.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFFFAE6CB),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Center(
                                child: Text('-',style:TextStyle(
                                    fontSize: 20.0,
                                    color:Color(0xFFFB9524)
                                ),),
                              )
                          ),
                        ),
                        Text("1",
                          style: kRobotoTextStyle.copyWith(
                            color: Colors.black
                          ),
                        ),
                        GestureDetector(
                          onTap: (){

                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 10.0),
                            width: 30.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFFFAE6CB),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Center(
                              child: Text('+',style:TextStyle(
                                  fontSize: 20.0,
                                  color:Color(0xFFFB9524)
                              ),),
                            ),
                          ),
                        ),
                      ],
                    ), //Counter
                  ),
                  IconButton(
                    icon: Icon(Icons.close,
                      color: Colors.red,
                    ),
                    onPressed: (){
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 11,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 90,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: AssetImage("assets/images/spaghetti.jpg"),
                        fit: BoxFit.fill
                    )
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
