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
Future<List<Order>>getOrder()async{
  String url ='$baseurl/orders/current';
  Response response = await httpClient.get(url);
  if(response.statusCode == 200){
    return parseOrder(response.body);
  }else{
    throw Exception ('Error on getting current order');
  }
}

List<Order> parseOrder(String responseBody){
  // final parsed = Map<String,dynamic>.from(jsonDecode(responseBody));
  // print("Response Body ${json.decode(responseBody)}");
  final parsed = json.decode(responseBody).cast<Map<String,dynamic>>();
  // print("Parsing list $parsed");
  // print("Returning ${parsed.map<Order>((json) => Order.fromJson(json)).toList()}");
  return parsed.map<Order>((json)=> Order.fromJson(json)).toList();

}