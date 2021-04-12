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
    restaurantMenuProducts: (json['restaurantMenuProducts'] as List)
        ?.map((e) => e == null
            ? null
            : RestaurantMenuProduct.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    createdAt: json['createdAt'] as String,
    updatedAt: json['updatedAt'] as String,
    deletedAt: json['deletedAt'] as String,
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'productId': instance.productId,
      'productName': instance.productName,
      'productImage': instance.productImage,
      'description': instance.description,
      'restaurantMenuProducts':
          instance.restaurantMenuProducts?.map((e) => e?.toJson())?.toList(),
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
    };
