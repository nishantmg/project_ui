// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    productId: json['productId'] as int,
    productName: json['productName'] as String,
    productImage: json['productImage'] as String,
    description: json['description'] as String,
    restaurantMenuProduct: json['restaurantMenuProduct'] == null
        ? null
        : RestaurantMenuProduct.fromJson(
            json['restaurantMenuProduct'] as Map<String, dynamic>),
    createdAt: json['createdAt'] as String,
    updatedAt: json['updatedAt'] as String,
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'productId': instance.productId,
      'productName': instance.productName,
      'productImage': instance.productImage,
      'description': instance.description,
      'restaurantMenuProduct': instance.restaurantMenuProduct?.toJson(),
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
