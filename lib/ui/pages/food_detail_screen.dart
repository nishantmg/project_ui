import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/models/restaurantMenuProduct.dart';
import 'package:food_delivery/resources/environment.dart';
import 'package:food_delivery/resources/services/CartService.dart';
import 'package:food_delivery/ui/widgets/SizeConfig.dart';
import 'package:food_delivery/ui/widgets/food_card.dart';
import 'package:food_delivery/ui/widgets/notification.util.dart';

class FoodDetailScreen extends StatefulWidget {
  static String id = "food_detail_screen";
  final RestaurantMenuProduct product;

  const FoodDetailScreen({this.product});

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
                height: 45.5 * SizeConfig.heightMultiplier,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("$imageUrl/${widget.product.product.productImage}"),
                      fit: BoxFit.fill,
                    )),
              ),
              Column(
                children: [
                  Container(
                    height: 8 * SizeConfig.heightMultiplier,
                    decoration: BoxDecoration(
                        color: Color(0xFF0E3311).withOpacity(0.3)
                    ),
                    child: Row(
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
                        Flexible(
                          child: Text(widget.product.restaurant.restaurantName,
                            overflow: TextOverflow.ellipsis,
                            style: kRoundedTextStyle.copyWith(
                                fontSize: 2.8 * SizeConfig.textMultiplier,
                                color: Colors.white
                            ),
                          ),
                        ),
                        IconButton(
                          icon:Icon(Icons.add_shopping_cart,
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
                  Container(
                    height: 8 * SizeConfig.heightMultiplier,
                    decoration: BoxDecoration(
                        color: Color(0xFF0E3311).withOpacity(0.3)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical:10, horizontal: 22),
                          child: Text(widget.product.product.productName,
                            style: kRoundedTextStyle.copyWith(
                                fontSize: 2.8 * SizeConfig.textMultiplier,
                                color: Colors.lightGreenAccent
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical:10, horizontal: 22),
                          child: Text("Rs.${widget.product.productPrice}",
                            style: kRoundedTextStyle.copyWith(
                              fontSize: 2.8 * SizeConfig.textMultiplier,
                              color: Colors.lightGreenAccent,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            _key.currentState.showSnackBar(SnackBar(
                              content: Text("Added to Favorite",),
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
                            height: 7.8 * SizeConfig.heightMultiplier,
                            decoration: BoxDecoration(
                                color: Color(0XFFeeeef3)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal:19.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.favorite,
                                    size: 6 * SizeConfig.imageSizeMultiplier,
                                    color: Colors.black,
                                  ),
                                  Text("ADD TO FAVORITE",
                                    style: kRoundedTextStyle.copyWith(
                                      fontSize: 1.7 * SizeConfig.textMultiplier,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () async{
                            await addItemToCart(
                              widget.product.product.productId,
                              1,
                              widget.product.productPrice,
                              widget.product.productPrice
                            ).then((res) => {
                              _key.currentState.showSnackBar(MessageBox.showMessage("Product Added to cart"))
                            }).catchError((err) => {
                              _key.currentState.showSnackBar(MessageBox.showMessage("Error adding to cart"))
                            });
                          },
                          child: Container(
                            height: 7.8 * SizeConfig.heightMultiplier,
                            decoration: BoxDecoration(
                              color: Color(0XFF69c730),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal:25.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.add_shopping_cart,
                                    size: 6 * SizeConfig.imageSizeMultiplier,
                                    color: Colors.white,
                                  ),
                                  Text("ADD TO CART",
                                    style: kRoundedTextStyle.copyWith(
                                      fontSize: 1.7 * SizeConfig.textMultiplier,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:18.0,vertical: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Description",
                                style: kRoundedTextStyle.copyWith(
                                    fontSize: 2.3 * SizeConfig.textMultiplier,
                                    color: Colors.black
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Column(
                            children: [
                              widget.product.product.description != null ?
                              Text(widget.product.product.description,
                                style: kOpenSansTextStyle.copyWith(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 2.2 * SizeConfig.textMultiplier
                                ),
                              ):
                              Text("No Description",
                                style: kOpenSansTextStyle.copyWith(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 2.2 * SizeConfig.textMultiplier
                                ),
                              )
                            ],
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
                              fontSize: 2.3 * SizeConfig.textMultiplier,
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
                                    image: NetworkImage("$imageUrl/${widget.product.product.productImage}"),
                                    name: widget.product.product.productName,
                                    price: widget.product.productPrice.toString(),
                                  ),
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

