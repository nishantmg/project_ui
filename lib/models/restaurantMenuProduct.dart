import 'package:food_delivery/models/menu.dart';
import 'package:food_delivery/models/product.dart';
import 'package:food_delivery/models/restaurant.dart';
import 'package:json_annotation/json_annotation.dart';
part 'restaurantMenuProduct.g.dart';

@JsonSerializable(explicitToJson: true)
class RestaurantMenuProduct {
  final int restaurantMenuProductId;
  final int menuId;
  final int productId;
  final int restaurantId;
  final int productPrice;
  final String createdAt;
  final String updatedAt;
  final String deletedAt;
  final Restaurant restaurant;
  final Menu menu;
  final Product product;


  RestaurantMenuProduct({this.restaurantMenuProductId, this.menuId, this.productId, this.restaurantId, this.productPrice, this.createdAt, this.updatedAt, this.deletedAt, this.restaurant, this.menu, this.product});

  factory RestaurantMenuProduct.fromJson(Map<String,dynamic> json) => _$RestaurantMenuProductFromJson(json);
  Map<String,dynamic> toJson() => _$RestaurantMenuProductToJson(this);
  // factory RestaurantMenuProduct.fromJson(Map<String,dynamic>json){
  //   return RestaurantMenuProduct(
  //            restaurantMenuProductId : json['restaurantMenuProductId'],
  //           menuId : json['menuId'],
  //           productId : json['productId'],
  //           restaurantId : json['restaurantId'],
  //           productPrice : json['productPrice'],
  //           createdAt : json['createdAt'],
  //           updatedAt : json['updatedAt'],
  //           deletedAt : json['deletedAt'],
  //           restaurant : Restaurant.fromJson(json['restaurant']),
  //           menu : Menu.fromJson(json['menu']),
  //           product : Product.fromJson(json['product']),
  //   );
  // }

  // RestaurantMenuProduct.fromMap(Map<String,dynamic>data):
  //       restaurantMenuProductId = data['restaurantMenuProductId'],
  //       menuId = data['menuId'],
  //       productId = data['productId'],
  //       restaurantId = data['restaurantId'],
  //       productPrice = data['productPrice'],
  //       createdAt = data['createdAt'],
  //       updatedAt = data['updatedAt'],
  //       deletedAt = data['deletedAt'],
  //       restaurant = Restaurant.fromMap(data['restaurant']),
  //       menu = Menu.fromMap(data['menu']),
  //       product = Product.fromMap(data['product']);
  // static List<RestaurantMenuProduct> fromData(List<Map<String,dynamic>> data){
  //   return data.map((product)=> RestaurantMenuProduct.fromJson(product)).toList();
  // }
}