// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) {
  return OrderItem(
    orderId: json['orderId'] as int,
    orderNo: json['orderNo'] as String,
    date: json['date'] as String,
    totalAmount: json['totalAmount'] as String,
    discount: json['discount'] as String,
    cartId: json['cartId'] as int,
    userId: json['userId'] as int,
    orderStatus: json['orderStatus'] as String,
    createdAt: json['createdAt'] as String,
    updatedAt: json['updatedAt'] as String,
    deletedAt: json['deletedAt'] as String,
  );
}

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
      'orderId': instance.orderId,
      'orderNo': instance.orderNo,
      'date': instance.date,
      'totalAmount': instance.totalAmount,
      'discount': instance.discount,
      'cartId': instance.cartId,
      'userId': instance.userId,
      'orderStatus': instance.orderStatus,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
    };
