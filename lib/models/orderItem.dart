import 'package:food_delivery/models/cartItem.dart';
import 'package:food_delivery/models/product.dart';
import 'package:food_delivery/models/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'orderItem.g.dart';


@JsonSerializable(explicitToJson: true)
class OrderItem{
  final int orderItemId;
  final String orderNo;
  final int orderId;
  final int productId;
  final String totalAmount;
  final int cartItemId;
  final int userId;
  final int quantity;
  final Product product;
  final CartItem cartItem;
  final User user;

  OrderItem(
      {this.orderItemId,
      this.orderNo,
      this.orderId,
      this.productId,
      this.totalAmount,
      this.cartItemId,
      this.userId,
      this.quantity,
      this.product,
      this.cartItem,
      this.user});



  factory OrderItem.fromJson(Map<String,dynamic> json) => _$OrderItemFromJson(json);
  Map<String,dynamic> toJson() => _$OrderItemToJson(this);
}