import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/ui/widgets/food_card.dart';

class FoodDetailScreen extends StatefulWidget {
  static String id = "food_detail_screen";

  @override
  _FoodDetailScreenState createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: SafeArea(
        child: SingleChildScrollView(
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
                      GestureDetector(
                        onTap: (){
                          _key.currentState.showSnackBar(SnackBar(
                            content: Text("Added to Favorite"),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {
                                // Some code to undo the change.
                              },
                            ),
                          )
                          );
                        },
                        child: Container(
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
                      ),
                      GestureDetector(
                        onTap: (){
                          _key.currentState.showSnackBar(SnackBar(
                            content: Text("Added to Cart"),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {
                                // Some code to undo the change.
                              },
                            ),
                          )
                          );
                        },
                        child: Container(
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
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:18.0,vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("You may also like",
                          style: kRoundedTextStyle.copyWith(
                              color: Colors.black
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height:190,
                    child:CustomScrollView(
                      scrollDirection: Axis.horizontal,
                      slivers: [
                        SliverList(
                          delegate: SliverChildListDelegate(
                              [
                                GestureDetector(
                                  onTap: (){
                                  },
                                  child: FoodCard(
                                    image: AssetImage('assets/images/spaghetti.jpg'),
                                    name: "Spaghetti",
                                    price: "200",
                                  ),
                                ),
                                FoodCard(
                                  image: AssetImage('assets/images/spaghetti.jpg'),
                                  name: "Spaghetti",
                                  price: "200",
                                ),
                                FoodCard(
                                  image: AssetImage('assets/images/spaghetti.jpg'),
                                  name: "Spaghetti",
                                  price: "200",
                                ),
                              ]
                          ),
                        )
                      ],
                    )
                    ,
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
