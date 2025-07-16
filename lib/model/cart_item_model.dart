import 'package:neuro_shop/model/product_model.dart';

class CartItemModel {
  final ProductModel productModel;
  final String quantity;
  final String color;
  final String size;

  CartItemModel(
      {required this.productModel, required this.quantity, required this.color, required this.size});

  factory CartItemModel.fromJson(Map<String, dynamic> jsonData){
    return CartItemModel(
        productModel: jsonData["product"],
        quantity: jsonData["quantity"],
        color: jsonData["color"],
        size: jsonData["size"]);
  }
}