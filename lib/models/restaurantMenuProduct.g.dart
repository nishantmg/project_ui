// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurantMenuProduct.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantMenuProduct _$RestaurantMenuProductFromJson(
    Map<String, dynamic> json) {
  return RestaurantMenuProduct(
    restaurantMenuProductId: json['restaurantMenuProductId'] as int,
    menuId: json['menuId'] as int,
    productId: json['productId'] as int,
    restaurantId: json['restaurantId'] as int,
    productPrice: json['productPrice'] as int,
    createdAt: json['createdAt'] as String,
    updatedAt: json['updatedAt'] as String,
    deletedAt: json['deletedAt'] as String,
    restaurant: json['restaurant'] == null
        ? null
        : Restaurant.fromJson(json['restaurant'] as Map<String, dynamic>),
    menu: json['menu'] == null
        ? null
        : Menu.fromJson(json['menu'] as Map<String, dynamic>),
    product: json['product'] == null
        ? null
        : Product.fromJson(json['product'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RestaurantMenuProductToJson(
        RestaurantMenuProduct instance) =>
    <String, dynamic>{
      'restaurantMenuProductId': instance.restaurantMenuProductId,
      'menuId': instance.menuId,
      'productId': instance.productId,
      'restaurantId': instance.restaurantId,
      'productPrice': instance.productPrice,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'restaurant': instance.restaurant?.toJson(),
      'menu': instance.menu?.toJson(),
      'product': instance.product?.toJson(),
    };
