class CartItemModel {
  final String title;
  //final String? photo;
  final int quantity;
  final String? color;
  final String? size;

  CartItemModel({
    required this.title,
    //required this.photo,
    required this.quantity,
    required this.color,
    required this.size,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> jsonData) {
    return CartItemModel(
      title: jsonData["product"]["title"],
      //photo: jsonData["product"]["photos"][0] ?? "",
      quantity: jsonData["quantity"],
      color: jsonData["color"],
      size: jsonData["size"],
    );
  }
}
