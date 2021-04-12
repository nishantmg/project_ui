import 'dart:convert';
import 'package:food_delivery/models/cart.dart';
import 'package:food_delivery/resources/environment.dart';
import 'package:food_delivery/resources/services/HttpCommon.dart';
import 'package:http/http.dart';

addItemToCart(productId, quantity, amount, productPrice) async
{
  String url = '$baseurl/carts/addItem';
  var cartObject = new Map();
  cartObject['productId'] = productId;
  cartObject['Quantity'] = quantity;
  cartObject['Amount'] = amount;
  cartObject['productPrice'] = productPrice;
  return await httpClient.post(url, body: json.encode(cartObject));
}

deleteCartItem(cartId,cartItemId)async{
  String url = "$baseurl/carts/$cartId/cartItems/$cartItemId";
  Response response = await httpClient.delete(url);
  if(response.statusCode == 200){
    print('Cart Item deleted');
  }
  else{
    print('Error deleting CartItem');
  }
}

Stream<Cart>getCart() async*{
  String url = "$baseurl/carts/mycart";
  Response response = await httpClient.get(url);
  if(response.statusCode == 200)
  {
    Cart cart = parseCart(response.body);
    await Future.delayed(Duration(seconds: 1));
    yield cart;
  }else{
    throw Exception('Failed to load carts');
  }
}

Cart parseCart(String responseBody){
  // final parsed = Map<String,dynamic>.from(jsonDecode(responseBody));
  final parsed = json.decode(responseBody).cast<String,dynamic>();
  return Cart.fromJson(parsed);
}

increaseQuantity(cartId,cartItemId) async{
  String url = "$baseurl/carts/$cartId/cartItems/$cartItemId/increase";
  Response response = await httpClient.put(url);
  if(response.statusCode == 200){
    print('Cart Item increased');
  }
  else{
    print('Error increasing CartItem quantity');
  }
}

decreaseQuantity(cartId,cartItemId) async{
  String url = "$baseurl/carts/$cartId/cartItems/$cartItemId/decrease";
  Response response = await httpClient.put(url);
  if(response.statusCode == 200){
    print('Cart Item decreased');
  }
  else{
    print('Error decreasing CartItem quantity');
  }
}