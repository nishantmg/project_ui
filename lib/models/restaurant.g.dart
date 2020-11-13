  // GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) {
  return Restaurant(
    restaurantId: json['restaurantId'] as int,
    restaurantName: json['restaurantName'] as String,
    restaurantImage: json['restaurantImage'] as String,
    status: json['status'] as bool,
    createdAt: json['createdAt'] as String,
    deletedAt: json['deletedAt'] as String,
  );
}

Map<String, dynamic> _$RestaurantToJson(Restaurant instance) =>
    <String, dynamic>{
      'restaurantId': instance.restaurantId,
      'restaurantName': instance.restaurantName,
      'restaurantImage': instance.restaurantImage,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'deletedAt': instance.deletedAt,
    };
