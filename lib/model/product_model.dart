import 'brand_model.dart';

class ProductModel {
  final String id;
  final String title;
  final BrandModel? brand;
  final int regularPrice;
  final int currentPrice;
  final double rating;
  final List<String> photos;
  final List<String> sizes;
  final List<String> colors;
  final int availableQuantity;
  final String description;

  ProductModel({
    required this.id,
    required this.title,
    required this.brand,
    required this.regularPrice,
    required this.currentPrice,
    required this.rating,
    required this.photos,
    required this.sizes,
    required this.colors,
    required this.availableQuantity,
    required this.description,
  });

  factory ProductModel.fromJson(Map<String, dynamic> jsonData){
    List<dynamic> photos = jsonData["photos"] ?? [];
    List<dynamic> sizes = jsonData["sizes"] ?? [];
    List<dynamic> colors = jsonData["colors"] ?? [];
    return ProductModel(
        id: jsonData["_id"],
        title: jsonData["title"],
        brand: BrandModel.fromJson(jsonData["brand"]),
        regularPrice: jsonData["regular_price"] ?? 0,
        currentPrice: jsonData["current_price"],
        rating: jsonData["rating"] ?? 0.0,
        photos: List<String>.from(photos),
        sizes: List<String>.from(sizes),
        colors: List<String>.from(colors),
        availableQuantity: jsonData["quantity"],
        description:jsonData["description"]);
  }

}


