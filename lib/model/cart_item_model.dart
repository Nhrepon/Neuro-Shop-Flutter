import 'package:flutter/widgets.dart';

class CartItemModel {
  final String id;
  final String title;
  final String? photo;
  int quantity;
  final String? color;
  final String? size;
  final int price;

  CartItemModel({
    required this.id,
    required this.title,
    required this.photo,
    required this.quantity,
    required this.color,
    required this.size,
    required this.price,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> jsonData) {
    debugPrint("Photo url: ${jsonData["product"]["photos"][0]}");
    return CartItemModel(
      id: jsonData["_id"],
      title: jsonData["product"]["title"],
      photo: jsonData["product"]["photos"][0],
      quantity: jsonData["quantity"] as int,
      color: jsonData["color"],
      size: jsonData["size"],
      price: jsonData["product"]["current_price"],
    );
  }
}
