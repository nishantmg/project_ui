import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/ui/widgets/SizeConfig.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({this.image,this.name});
  final AssetImage image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,),
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
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      height: 15* SizeConfig.heightMultiplier,
                      width: 25 * SizeConfig.widthMultiplier,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: image,
                              fit: BoxFit.fill
                          )
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(name,
                          overflow: TextOverflow.visible,
                          style: kRobotoTextStyle.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 2 * SizeConfig.textMultiplier,
                              color: Colors.black
                          ),
                        ),
                      )
                    ],
                  )
                ),
               ],
            ),
          ),
        ],
      ),
    );
  }
}
