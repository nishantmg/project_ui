import 'package:flutter/material.dart';
import 'package:food_delivery/constants.dart';
import 'package:food_delivery/models/cartItem.dart';
import 'package:food_delivery/resources/environment.dart';
import 'package:food_delivery/resources/services/CartService.dart';
import 'SizeConfig.dart';

class OrderItem extends StatefulWidget {

  final CartItem cart;

  const OrderItem({this.cart});

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  int quantity;

  @override
  Widget build(BuildContext context) {
    quantity = widget.cart.quantity.toInt();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
      child: Stack(
        children: [
          Container(
            height: 17 * SizeConfig.heightMultiplier,
          ),
          Positioned.fill(
            left:8* SizeConfig.widthMultiplier,
            child: Card(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 14 * SizeConfig.widthMultiplier,),
                  Container(
                    width: 60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(widget.cart.product.productName,
                            overflow: TextOverflow.visible,
                            style: kRobotoTextStyle.copyWith(
                                fontSize: 2 * SizeConfig.textMultiplier,
                                color: Colors.black
                            ),
                          ),
                        ),
                        widget.cart != null ? Text("Rs.${widget.cart.productPrice}",
                          style: kRobotoTextStyle.copyWith(
                              fontSize: 2 * SizeConfig.textMultiplier,
                              color: Colors.black,
                              fontWeight: FontWeight.normal
                          ),
                        ) : Text("Rs.aayena",
                          style: kRobotoTextStyle.copyWith(
                              fontSize: 2 * SizeConfig.textMultiplier,
                              color: Colors.black,
                              fontWeight: FontWeight.normal
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10.0),
                        height:8 * SizeConfig.widthMultiplier,
                        width:21 * SizeConfig.widthMultiplier,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFAE6CB),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            GestureDetector(
                              onTap: (){
                                decreaseQuantity(widget.cart.cartId, widget.cart.cartItemId);
                                setState(() {
                                  print(quantity);
                                  if(quantity>0){
                                    quantity--;
                                  }
                                  quantity=1;
                                });
                              },
                              child: Container(
                                width: 5 * SizeConfig.widthMultiplier,
                                child: Center(
                                  child: Text('-',style:TextStyle(
                                      fontSize: 23.0,
                                      color:Color(0xFFFB9524)
                                  ),),
                                ),
                              ),
                            ),
                            widget.cart !=null ? Text(quantity.toString(),
                              style: kRobotoTextStyle.copyWith(
                                  fontSize: 2 * SizeConfig.textMultiplier,
                                  color: Colors.black
                              ),
                            ) : Text(quantity.toString(),
                              style: kRobotoTextStyle.copyWith(
                                  fontSize: 2 * SizeConfig.textMultiplier,
                                  color: Colors.black
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                print(quantity);
                                increaseQuantity(widget.cart.cartId, widget.cart.cartItemId);
                                setState(() {
                                  quantity++;
                                });
                              },
                              child: Container(
                                width: 5 * SizeConfig.widthMultiplier,
                                child: Text('+',style:TextStyle(
                                    fontSize: 18.0,
                                    color:Color(0xFFFB9524)
                                ),),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        deleteCartItem(widget.cart.cartId, widget.cart.cartItemId);
                        },
                      child: Icon(Icons.close,
                        color: Colors.red,
                        size: 19,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 11,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 11 * SizeConfig.heightMultiplier,
                width: 22 * SizeConfig.widthMultiplier,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: NetworkImage("$imageUrl/${widget.cart.product.productImage}"),
                        fit: BoxFit.fill
                    )
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
