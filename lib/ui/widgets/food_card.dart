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
            height: 24* SizeConfig.heightMultiplier,
            width: 30 * SizeConfig.widthMultiplier,
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      height: 15* SizeConfig.heightMultiplier,
                      width: 25 * SizeConfig.widthMultiplier,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image: image,
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(name,
                              style: kRobotoTextStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 2 * SizeConfig.textMultiplier,
                                  color: Colors.black
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text("Rs. $price",
                        style: kOpenSansTextStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 1.8 * SizeConfig.textMultiplier,
                            color: Colors.black
                        ),
                      ),
                    ],
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
