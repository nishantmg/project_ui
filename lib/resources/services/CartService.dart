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

Future<Cart>getCart() async{
  String url = "$baseurl/carts/mycart";
  Response response = await httpClient.get(url);
  if(response.statusCode == 200)
  {
    Cart cart = parseCart(response.body);

    return cart;
  }else{
    throw Exception('Failed to load restaurants');
  }
}

Cart parseCart(String responseBody){
  // final parsed = Map<String,dynamic>.from(jsonDecode(responseBody));
  final parsed = json.decode(responseBody).cast<String,dynamic>();
  return Cart.fromJson(parsed);
}