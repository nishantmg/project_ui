import 'package:food_delivery/models/restaurantMenuProduct.dart';
import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

@JsonSerializable(explicitToJson: true)
class Product{
  final int productId;
  final String productName;
  final String productImage;
  final String description;
  final RestaurantMenuProduct restaurantMenuProduct;
  final String createdAt;
  final String updatedAt;

  Product({this.productId, this.productName, this.productImage, this.description, this.restaurantMenuProduct, this.createdAt, this.updatedAt});


  factory Product.fromJson(Map<String,dynamic> json) => _$ProductFromJson(json);
  Map<String,dynamic> toJson() => _$ProductToJson(this);
  // factory Product.fromJson(Map<String,dynamic> json){
  //   return Product(
  //       productId : json['productId'],
  //       productName : json['productName'],
  //       productImage : json['productImage'],
  //       description : json['description'],
  //       createdAt : json['createdAt'],
  //       updatedAt : json['updatedAt'],
  //       restaurantMenuProduct : RestaurantMenuProduct.fromJson(json['restaurantMenuProduct'])
  //   );
  // }
  // Product.fromMap(Map<String,dynamic>data):
  //       productId = data['productId'],
  //       productName = data['productName'],
  //       productImage = data['productImage'],
  //       description = data['description'],
  //       createdAt = data['createdAt'],
  //       updatedAt = data['updatedAt'],
  //       restaurantMenuProduct = RestaurantMenuProduct.fromMap(data['restaurantMenuProduct']);
  // static List<Product> fromData(List<Map<String,dynamic>> data){
  //   return data.map((product)=> Product.fromJson(product)).toList();
  // }

}