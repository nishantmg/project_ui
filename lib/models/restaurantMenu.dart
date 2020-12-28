import 'package:food_delivery/models/product.dart';
import 'package:json_annotation/json_annotation.dart';
part 'restaurantMenu.g.dart';

@JsonSerializable(explicitToJson: true)
class RestaurantMenu{
  final int id;
  final String name;
  final List<Product> products;

  RestaurantMenu({this.id, this.name, this.products});
  factory RestaurantMenu.fromJson(Map<String,dynamic> json) => _$RestaurantMenuFromJson(json);
  Map<String, dynamic> toJson() => _$RestaurantMenuToJson(this);
}