import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neuro_shop/widgets/product_card.dart';


class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.category});
  final String category;

  static const String name = "/product-list";

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 8
          ),
          itemBuilder: (context, index) {
            return FittedBox(
              fit: BoxFit.cover,
                child: ProductCard()
            );
          },
        ),
      ),
    );
  }
}
