import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/ui/widgets/SizeConfig.dart';

class Order extends StatelessWidget {
  const Order({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child:Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Container(
                height: 15 * SizeConfig.heightMultiplier,
                width: 15 * SizeConfig.widthMultiplier,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/order.jpg')
                    )
                )
            ),
          ),
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
                      child: Text("hello",
                        overflow: TextOverflow.visible,
                        style: kRobotoTextStyle.copyWith(
                            fontSize: 2 * SizeConfig.textMultiplier,
                            color: Colors.black
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:8,top:8.0,bottom:10),
                      child:Text("Rs.aayena",
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
        ],
      ),
    );
  }
}
