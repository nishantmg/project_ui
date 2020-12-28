import 'dart:convert';

import 'package:food_delivery/models/order.dart';
import 'package:food_delivery/resources/environment.dart';
import 'package:food_delivery/resources/services/HttpCommon.dart';
import 'package:http/http.dart';

postOrder(cartId,address) async{
   String url = '$baseurl/orders/carts/$cartId';
   var shippingAddressObject = new Map();
   shippingAddressObject['address'] = address;
   Response response = await httpClient.post(url, body: json.encode(shippingAddressObject));
   if(response.statusCode==201){
     return response;
   }else{
     throw Exception("Error occured adding order");
   }
}
getOrder()async{
  String url ='$baseurl/orders/current';
  Response response = await httpClient.get(url);
  if(response.statusCode == 200){
    Order order = parseOrder(response.body);
    print (order);
  }else{
    throw Exception ('Error on getting current order');
  }
}

Order parseOrder(String responseBody){
  // final parsed = Map<String,dynamic>.from(jsonDecode(responseBody));
  print(responseBody);
  final parsed = json.decode(responseBody).cast<String,dynamic>();
  print('parse vayo $parsed');
  return Order.fromJson(parsed);
}