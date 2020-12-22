import 'package:json_annotation/json_annotation.dart';
part 'orderItem.g.dart';


@JsonSerializable(explicitToJson: true)
class OrderItem{
  final int orderId;
  final String orderNo;
  final String date;
  final String totalAmount;
  final String discount;
  final int cartId;
  final int userId;
  final String orderStatus;
  final String createdAt;
  final String updatedAt;
  final String deletedAt;

  OrderItem(
      {this.orderId,
      this.orderNo,
      this.date,
      this.totalAmount,
      this.discount,
      this.cartId,
      this.userId,
      this.orderStatus,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  factory OrderItem.fromJson(Map<String,dynamic> json) => _$OrderItemFromJson(json);
  Map<String,dynamic> toJson() => _$OrderItemToJson(this);
}