import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/models/product.dart';
import 'package:food_delivery/models/restaurantMenu.dart';
import 'package:food_delivery/resources/services/CartService.dart';
import 'package:food_delivery/resources/services/RestaurantMenuProductService.dart';
import 'package:food_delivery/ui/pages/food_list_screen.dart';
import 'package:food_delivery/ui/widgets/SizeConfig.dart';


class RestaurantDetailScreen extends StatefulWidget {
  static String id = "restaurant_detail_screen";
  final NetworkImage restaurantImage;
  final String restaurantName;
  final int restaurantId;

  const RestaurantDetailScreen({@required this.restaurantImage,@required this.restaurantName,this.restaurantId});

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
        child: Column(
          children: [
            Stack(
              children: [
                Container (
                  height: 25 * SizeConfig.heightMultiplier,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: widget.restaurantImage,
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
                          Text(widget.restaurantName,
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
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Text(widget.restaurantName,
                style: kRoundedTextStyle.copyWith(
                    color: Colors.green
                ),
              ),
            ),
            Container(
              height: 57*SizeConfig.heightMultiplier,
              child: FutureBuilder(
                builder: (context, snapshot) {
                  if ((snapshot.connectionState != ConnectionState.done) &&
                      snapshot.hasData == false) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.green,
                      ),
                    );
                  }else if(snapshot.connectionState != ConnectionState.waiting && snapshot.hasData ==false){
                    return Center(
                      child: Text("No Menus Added"),
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      print(snapshot.data);
                      RestaurantMenu menu = snapshot.data[index];
                      return GestureDetector(
                        onTap: () async{
                          Navigator.push(context, MaterialPageRoute(
                              builder:(context) => FoodListScreen(restaurantId: widget.restaurantId,menu: menu,))
                          );
                        },
                        child: ListTile(
                          title: Text(menu.name),
                          trailing: Icon(Icons.arrow_right),
                        ),
                      );
                    },
                  ) ;
                },
                future: getRestaurantMenus(widget.restaurantId),
              ),
            )
          ],
        ),
      ),
    );
  }
}
