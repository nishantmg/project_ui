// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cart _$CartFromJson(Map<String, dynamic> json) {
  return Cart(
    cartId: json['cartId'] as int,
    totalAmount: (json['totalAmount'] as num)?.toDouble(),
    totalDiscount: (json['totalDiscount'] as num)?.toDouble(),
    quantity: json['quantity'] as int,
    totalTax: json['totalTax'] == null
        ? null
        : Product.fromJson(json['totalTax'] as Map<String, dynamic>),
    status: json['status'] as bool,
    userId: json['userId'] as int,
    cartItems: (json['cartItems'] as List)
        ?.map((e) =>
            e == null ? null : CartItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      'cartId': instance.cartId,
      'totalAmount': instance.totalAmount,
      'totalDiscount': instance.totalDiscount,
      'quantity': instance.quantity,
      'totalTax': instance.totalTax?.toJson(),
      'status': instance.status,
      'userId': instance.userId,
      'cartItems': instance.cartItems?.map((e) => e?.toJson())?.toList(),
    };
