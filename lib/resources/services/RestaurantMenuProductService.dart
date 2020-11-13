import 'dart:convert';

import 'package:food_delivery/models/restaurantMenuProduct.dart';
import 'package:food_delivery/resources/environment.dart';
import 'package:http/http.dart' as http;

Future<List<RestaurantMenuProduct>> getRestaurantProducts()async{
  String url = "$baseurl/restaurant_menu_products";
  http.Response response = await http.get(url);
  if(response.statusCode == 200)
  {
    List<Map<String,dynamic>> products = List<Map<String,dynamic>>.from(jsonDecode(response.body));
    print(RestaurantMenuProduct.fromData(products));
    return RestaurantMenuProduct.fromData(products);
  }else{
    throw Exception('Failed to load restaurants');
  }
}