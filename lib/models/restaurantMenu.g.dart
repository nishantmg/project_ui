// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurantMenu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantMenu _$RestaurantMenuFromJson(Map<String, dynamic> json) {
  return RestaurantMenu(
    id: json['id'] as int,
    name: json['name'] as String,
    products: (json['products'] as List)
        ?.map((e) =>
            e == null ? null : Product.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RestaurantMenuToJson(RestaurantMenu instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'products': instance.products?.map((e) => e?.toJson())?.toList(),
    };
