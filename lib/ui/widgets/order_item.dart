import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'SizeConfig.dart';

class OrderItem extends StatefulWidget {
  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {

  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
      child: Stack(
        children: [
          Container(
            height: 17 * SizeConfig.heightMultiplier,
          ),
          Positioned.fill(
            left:9 * SizeConfig.widthMultiplier,
            child: Card(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 14 * SizeConfig.widthMultiplier,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top:12.0,left:8.0,bottom: 5.0),
                              child: Text("Spaghetti",
                                style: kRobotoTextStyle.copyWith(
                                    fontSize: 2.5 * SizeConfig.textMultiplier,
                                    color: Colors.black
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:8,top:8.0,bottom:10),
                              child: Text("Rs.200",
                                style: kRobotoTextStyle.copyWith(
                                    fontSize: 2 * SizeConfig.textMultiplier,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal
                                ),
                              ),
                            )
                          ],
                        ),
                      ),//Naming and pricing
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10.0),
                            width:18 * SizeConfig.widthMultiplier,
                            decoration: BoxDecoration(
                              color: Color(0xFFFFAE6CB),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      if(quantity>0){
                                        quantity--;
                                      }
                                      quantity=0;
                                    });
                                  },
                                  child: Text('-',style:TextStyle(
                                      fontSize: 20.0,
                                      color:Color(0xFFFB9524)
                                  ),),
                                ),
                                Text(quantity.toString(),
                                  style: kRobotoTextStyle.copyWith(
                                      fontSize: 2 * SizeConfig.textMultiplier,
                                      color: Colors.black
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      quantity++;
                                    });
                                  },
                                  child: Text('+',style:TextStyle(
                                      fontSize: 18.0,
                                      color:Color(0xFFFB9524)
                                  ),),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: (){
                          },
                          child: Icon(Icons.close,
                            color: Colors.red,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 11,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 11 * SizeConfig.heightMultiplier,
                width: 22 * SizeConfig.widthMultiplier,
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
