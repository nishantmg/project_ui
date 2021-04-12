// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cartItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItem _$CartItemFromJson(Map<String, dynamic> json) {
  return CartItem(
    cartItemId: json['cartItemId'] as int,
    quantity: json['quantity'] as int,
    amount: (json['amount'] as num)?.toDouble(),
    productId: json['productId'] as int,
    product: json['product'] == null
        ? null
        : Product.fromJson(json['product'] as Map<String, dynamic>),
    cartId: json['cartId'] as int,
    productPrice: (json['productPrice'] as num)?.toDouble(),
    userId: json['userId'] as int,
  );
}

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
      'cartItemId': instance.cartItemId,
      'quantity': instance.quantity,
      'amount': instance.amount,
      'productId': instance.productId,
      'product': instance.product?.toJson(),
      'cartId': instance.cartId,
      'productPrice': instance.productPrice,
      'userId': instance.userId,
    };
