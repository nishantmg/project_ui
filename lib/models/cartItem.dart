import 'package:food_delivery/models/product.dart';
import 'package:json_annotation/json_annotation.dart';
part 'cartItem.g.dart';

@JsonSerializable(explicitToJson: true)
class CartItem{
  final int cartItemId;
  final int quantity;
  final double amount;
  final int productId ;
  final Product product;
  final int cartId;
  final double productPrice;
  final int userId;

  CartItem({this.cartItemId, this.quantity, this.amount, this.productId, this.product, this.cartId, this.productPrice, this.userId});



   factory CartItem.fromJson(Map<String,dynamic> json) => _$CartItemFromJson(json);
   Map<String, dynamic> toJson() => _$CartItemToJson(this);

}