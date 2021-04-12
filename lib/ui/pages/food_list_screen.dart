import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/models/restaurantMenu.dart';
import 'package:food_delivery/models/restaurantMenuProduct.dart';
import 'package:food_delivery/resources/environment.dart';
import 'package:food_delivery/resources/services/RestaurantMenuProductService.dart';
import 'package:food_delivery/ui/pages/food_detail_screen.dart';
import 'package:food_delivery/ui/widgets/SizeConfig.dart';

class FoodListScreen extends StatefulWidget {

  static String id = "food_list_screen";
  final int restaurantId;
  final RestaurantMenu menu;
  const FoodListScreen({Key key,this.menu,this.restaurantId}) : super(key: key);
  @override
  _FoodListScreenState createState() => _FoodListScreenState();
}

class _FoodListScreenState extends State<FoodListScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: SafeArea(
        child: Column(
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
                    child: Text(widget.menu.name,
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
                      // Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: 57*SizeConfig.heightMultiplier,
              child: FutureBuilder(
                builder: (context, snapshot) {
                  print('data xaina${snapshot.data}');
                  if ((snapshot.connectionState != ConnectionState.done) &&
                      snapshot.hasData == false) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.green,
                      ),
                    );
                  }else if(snapshot.connectionState != ConnectionState.waiting && snapshot.hasData ==false){
                    return Center(
                      child: Text("No Products Added"),
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      print(snapshot.data);
                      RestaurantMenuProduct product = snapshot.data[index];
                      return GestureDetector(
                        onTap: () async{
                          Navigator.push(context, MaterialPageRoute(
                              builder:(context) => FoodDetailScreen(product:product,))
                          );
                        },
                        child: ListTile(
                          leading: Container(
                            height: 8* SizeConfig.heightMultiplier,
                            width: 14 * SizeConfig.widthMultiplier,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image:  NetworkImage('$imageUrl/${product.product.productImage}'),
                                    fit: BoxFit.fill
                                )
                            ),
                          ),
                          title: Text(product.product.productName),
                          subtitle: Text('Rs.${product.productPrice}'),
                        ),
                      );
                    },
                  ) ;
                },
                future: getRestaurantMenuProductsByMenuId(widget.restaurantId,widget.menu.id),
              ),
            )
          ],
        ),
      ),
    );
  }
}
