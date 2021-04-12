import 'package:json_annotation/json_annotation.dart';
part 'restaurant.g.dart';

@JsonSerializable(explicitToJson: true)
class Restaurant{
    final int restaurantId;
    final String restaurantName;
    final String image;
    final bool status ;
    final String createdAt;
    final String deletedAt;

  Restaurant({this.restaurantId, this.restaurantName, this.image, this.status, this.createdAt, this.deletedAt});


  factory Restaurant.fromJson(Map<String,dynamic> json) => _$RestaurantFromJson(json);
  Map<String, dynamic> toJson() => _$RestaurantToJson(this);
  // factory Restaurant.fromJson(Map<String,dynamic> json){
  //   return Restaurant(
  //         restaurantId : json['restaurantId'],
  //         restaurantName : json['restaurantName'],
  //         restaurantImage : json['restaurantImage'],
  //         status : json['status'],
  //         createdAt : json['createdAt'],
  //         deletedAt : json['deletedAt'],
  //   );
  // }

  // Restaurant.fromMap(Map<String, dynamic> data):
  //     restaurantId = data['restaurantId'],
  //     restaurantName = data['restaurantName'],
  //     restaurantImage = data['restaurantImage'],
  //     status = data['status'],
  //     createdAt = data['createdAt'],
  //     deletedAt = data['deletedAt'];
  //   static List<Restaurant> fromData(List<Map<String,dynamic>> data){
  //     return data.map((restaurant) => Restaurant.fromJson(restaurant)).toList();
  //   }
}