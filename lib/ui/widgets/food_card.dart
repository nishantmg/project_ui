import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/ui/widgets/SizeConfig.dart';

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 19.9 * SizeConfig.heightMultiplier,
            width: 45 * SizeConfig.widthMultiplier,
            child: Stack(
              children:[
                Positioned(
                  top: 30,
                  child: Container(
                    height: 15* SizeConfig.heightMultiplier,
                    width: 44 * SizeConfig.widthMultiplier,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(5),
                    ),
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(name,
                                style: kRobotoTextStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                    fontSize: 2 * SizeConfig.textMultiplier,
                                    color: Colors.black
                                ),
                              ),
                              Text("Rs. $price",
                                style: kOpenSansTextStyle.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 2 * SizeConfig.textMultiplier,
                                    color: Colors.black
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 2.5 * SizeConfig.heightMultiplier,)
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  child: Container(
                    height: 13* SizeConfig.heightMultiplier,
                    width: 38 * SizeConfig.widthMultiplier,
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
