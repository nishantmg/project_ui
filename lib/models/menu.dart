import 'package:json_annotation/json_annotation.dart';
import 'package:food_delivery/models/restaurantMenuProduct.dart';
part 'menu.g.dart';

@JsonSerializable(explicitToJson: true)
class Menu {
  final int menuId;
  final String menuName;
  final String createdAt;
  final String updatedAt;
  final String deletedAt;
  final List<RestaurantMenuProduct> restaurantMenuProduct;

  Menu({this.menuId, this.menuName, this.createdAt, this.updatedAt, this.deletedAt, this.restaurantMenuProduct});

  factory Menu.fromJson(Map<String,dynamic> json) => _$MenuFromJson(json);
  Map<String,dynamic> toJson()=> _$MenuToJson(this);
  // factory Menu.fromJson(Map<String,dynamic>json){
  //   return Menu(
  //           menuId : json['menuId'],
  //           menuName : json['menuName'],
  //           createdAt : json['createdAt'],
  //           updatedAt : json['updatedAt'],
  //           deletedAt : json['deletedAt'],
  //           restaurantMenuProduct : RestaurantMenuProduct.fromJson(json['restaurantMenuProduct'])
  //   );
  // }
  // Menu.fromMap(Map<String,dynamic>data):
  //       menuId = data['menuId'],
  //       menuName = data['menuName'],
  //       createdAt = data['createdAt'],
  //       updatedAt = data['updatedAt'],
  //       deletedAt = data['deletedAt'],
  //       restaurantMenuProduct = RestaurantMenuProduct.fromMap(data['restaurantMenuProduct']);
  // static List<Menu> fromData(List<Map<String,dynamic>> data){
  //   return data.map((menu)=> Menu.fromJson(menu)).toList();
  // }
}