import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({this.image,this.name,this.price});
  final AssetImage image;
  final String name;
  final String price;

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
                              Text(name,
                                style: kRobotoTextStyle.copyWith(
                                    color: Colors.black
                                ),
                              ),
                              SizedBox(width: 41,),
                              Text("Rs. $price",
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
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: image,
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
