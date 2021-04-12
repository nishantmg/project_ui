import 'package:food_delivery/models/cartItem.dart';
import 'package:food_delivery/models/product.dart';
import 'package:json_annotation/json_annotation.dart';

import 'cartItem.dart';
part 'cart.g.dart';

@JsonSerializable(explicitToJson: true)
class Cart{
  final int cartId;
  final double totalAmount;
  final double totalDiscount;
  final int quantity ;
  final Product totalTax;
  final bool status;
  final int userId;
  final List<CartItem> cartItems;

  Cart({this.cartId, this.totalAmount, this.totalDiscount, this.quantity, this.totalTax, this.status, this.userId, this.cartItems});

  factory Cart.fromJson(Map<String,dynamic> json) => _$CartFromJson(json);
  Map<String, dynamic> toJson() => _$CartToJson(this);

}