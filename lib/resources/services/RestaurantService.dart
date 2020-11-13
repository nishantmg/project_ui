import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:food_delivery/models/restaurant.dart';
import 'package:food_delivery/resources/environment.dart';

Future<List<Restaurant>>getRestaurants() async{
  String url = "$baseurl/restaurants";
  http.Response response = await http.get(url);
  if(response.statusCode == 200)
  {
    // List<Map<String,dynamic>> restaurants = List<Map<String,dynamic>>.from(jsonDecode(response.body));
    print('naya tarika');
    print (parseRestaurants(response.body));
  }else{
    throw Exception('Failed to load restaurants');
  }
}

 List<Restaurant> parseRestaurants(String responseBody){
  // final parsed = Map<String,dynamic>.from(jsonDecode(responseBody));
  final parsed = json.decode(responseBody).cast<List<Map<String,dynamic>>>();
  return parsed.map<Restaurant>((json) => Restaurant.fromJson(json)).toList();
}