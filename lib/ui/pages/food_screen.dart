import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';


class FoodScreen extends StatefulWidget {
  static String id = "food_screen";
  @override
  _FoodScreenState createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: 280,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/spaghetti.jpg"),
                    fit: BoxFit.fill,
                  )),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon:Icon(Icons.arrow_back_ios,
                        color:Colors.black,
                        size: 20.0,
                      ),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 95),
                      child: Text("Spaghetti",
                        style: kRoundedTextStyle.copyWith(
                            color: Colors.black
                        ),
                      ),
                    ),
                    IconButton(
                      icon:Icon(Icons.add_shopping_cart,
                        color:Colors.black,
                        size: 20.0,
                      ),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 182,),
                Container(
                  width: 360,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color(0xFF0E3311).withOpacity(0.3)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical:10, horizontal: 22),
                        child: Text("Rs. 200",
                          style: kRoundedTextStyle.copyWith(
                            color: Colors.lightGreenAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 180,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color(0XFFeeeef3)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal:19.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.favorite,
                              color: Colors.black,
                            ),
                            Text("ADD TO FAVORITE",
                              style: kRoundedTextStyle.copyWith(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 180,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color(0XFF69c730),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal:25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.add_shopping_cart,
                              color: Colors.white,
                            ),
                            Text("ADD TO CART",
                              style: kRoundedTextStyle.copyWith(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:18.0,vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Description",
                        style: kRoundedTextStyle.copyWith(
                          color: Colors.black
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
