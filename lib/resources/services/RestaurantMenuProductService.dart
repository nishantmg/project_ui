import 'dart:convert';
import 'package:food_delivery/models/restaurantMenuProduct.dart';
import 'package:food_delivery/models/restaurantMenu.dart';
import 'package:food_delivery/resources/environment.dart';
import 'package:food_delivery/resources/services/HttpCommon.dart';
import 'package:http/http.dart' as http;

Future<List<RestaurantMenuProduct>> getRestaurantProducts()async{
  String url = "$baseurl/restaurant_menu_products";
  http.Response response = await httpClient.get(url);
  if(response.statusCode == 200)
  {
    // List<Map<String,dynamic>> products = List<Map<String,dynamic>>.from(jsonDecode(response.body));
    // return RestaurantMenuProduct.fromData(products);
    return parseRestaurantProducts(response.body);
  }else{
    throw Exception('Failed to load restaurants');
  }
}

List<RestaurantMenuProduct> parseRestaurantProducts(String responseBody){
  final parsed = json.decode(responseBody).cast<Map<String,dynamic>>();
  // print('RMP$parsed');
  return  parsed.map<RestaurantMenuProduct>((json) => RestaurantMenuProduct.fromJson(json)).toList();
}

Future<List<RestaurantMenuProduct>> getRestaurantMenuProductsByMenuId(restaurantId,menuId)async{
  String url= "$baseurl/restaurant_menu_products/$restaurantId/$menuId";
  http.Response response = await httpClient.get(url);
  if(response.statusCode == 200){
    return parseRestaurantProducts(response.body);
  }else{
    throw Exception('Failed to load the restaurant menu products');
  }
}

Future<List<RestaurantMenu>> getRestaurantMenus(int restaurantId) async{
  String url = "$baseurl/restaurants/$restaurantId/menus";
  http.Response response = await httpClient.get(url);
  if(response.statusCode == 200){
    return parseRestaurantMenus(response.body);
  }else{
    throw Exception("Failed to load restaurant menus");
  }
}
  List<RestaurantMenu> parseRestaurantMenus(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String,dynamic>>();
    return parsed.map<RestaurantMenu>((json) => RestaurantMenu.fromJson(json)).toList();
  }
