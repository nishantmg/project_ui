import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/ui/widgets/SizeConfig.dart';


class RestaurantDetailScreen extends StatefulWidget {
  static String id = "restaurant_detail_screen";
  @override
  _RestaurantDetailScreenState createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen> {

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container (
                height: 45.5 * SizeConfig.heightMultiplier,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/baishnab.jpeg"),
                      fit: BoxFit.fill,
                    )),
              ),
              Column(
                children: [
                  Container(
                    height: 8 * SizeConfig.heightMultiplier,
                    decoration: BoxDecoration(
                        color: Color(0xFF0E3311).withOpacity(0.6)
                    ),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon:Icon(Icons.arrow_back_ios,
                            color:Colors.white,
                            size: 19.0,
                          ),
                          onPressed: (){
                            Navigator.pop(context);
                          },
                        ),
                        Text("Baishnab Sweets",
                          style: kRoundedTextStyle.copyWith(
                              fontSize: 2.8 * SizeConfig.textMultiplier,
                              color: Colors.white
                          ),
                        ),
                        IconButton(
                          icon:Icon(Icons.shopping_cart,
                            color:Colors.white,
                            size: 19.0,
                          ),
                          onPressed: (){
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 29.5 * SizeConfig.heightMultiplier,),
                  SingleChildScrollView(
                    child: Column(

                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
