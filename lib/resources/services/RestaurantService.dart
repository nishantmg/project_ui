import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:food_delivery/models/restaurant.dart';
import 'package:food_delivery/resources/environment.dart';

Future<List<Restaurant>>getRestaurants() async{
  String url = "$baseurl/restaurants";
  http.Response response = await http.get(url);
  if(response.statusCode == 200)
  {
    print(response.body);
    List<Map<String,dynamic>> restaurants = List<Map<String,dynamic>>.from(jsonDecode(response.body));
    return Restaurant.fromData(restaurants);
  }else{
    throw Exception('Failed to load restaurants');
  }
}