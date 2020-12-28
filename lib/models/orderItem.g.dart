// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) {
  return OrderItem(
    orderItemId: json['orderItemId'] as int,
    orderNo: json['orderNo'] as String,
    orderId: json['orderId'] as int,
    productId: json['productId'] as int,
    totalAmount: json['totalAmount'],
    cartItemId: json['cartItemId'] as int,
    userId: json['userId'] as int,
    quantity: json['quantity'] as int,
    product: json['product'] == null
        ? null
        : Product.fromJson(json['product'] as Map<String, dynamic>),
    cartItem: json['cartItem'] == null
        ? null
        : CartItem.fromJson(json['cartItem'] as Map<String, dynamic>),
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
      'orderItemId': instance.orderItemId,
      'orderNo': instance.orderNo,
      'orderId': instance.orderId,
      'productId': instance.productId,
      'totalAmount': instance.totalAmount,
      'cartItemId': instance.cartItemId,
      'userId': instance.userId,
      'quantity': instance.quantity,
      'product': instance.product?.toJson(),
      'cartItem': instance.cartItem?.toJson(),
      'user': instance.user?.toJson(),
    };
