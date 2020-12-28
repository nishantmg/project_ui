import 'package:food_delivery/models/cart.dart';
import 'package:food_delivery/models/orderItem.dart';
import 'package:food_delivery/models/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'order.g.dart';


@JsonSerializable(explicitToJson: true)
class Order{
  final int orderId;
  final String orderNo;
  final String date;
  final dynamic totalAmount;
  final dynamic discount;
  final int cartId;
  final int userId;
  final String orderStatus;
  final String createdAt;
  final String updatedAt;
  final String deletedAt;
  final List<OrderItem> orderItems;
  final Cart cart;
  final User user;

  Order(
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
      this.deletedAt,
      this.cart,
      this.user,
      this.orderItems});

  factory Order.fromJson(Map<String,dynamic> json) => _$OrderFromJson(json);
  Map<String,dynamic> toJson() => _$OrderToJson(this);
}