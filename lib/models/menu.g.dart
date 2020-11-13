// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Menu _$MenuFromJson(Map<String, dynamic> json) {
  return Menu(
    menuId: json['menuId'] as int,
    menuName: json['menuName'] as String,
    createdAt: json['createdAt'] as String,
    updatedAt: json['updatedAt'] as String,
    deletedAt: json['deletedAt'] as String,
    restaurantMenuProduct: json['restaurantMenuProduct'] == null
        ? null
        : RestaurantMenuProduct.fromJson(
            json['restaurantMenuProduct'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MenuToJson(Menu instance) => <String, dynamic>{
      'menuId': instance.menuId,
      'menuName': instance.menuName,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'restaurantMenuProduct': instance.restaurantMenuProduct?.toJson(),
    };
