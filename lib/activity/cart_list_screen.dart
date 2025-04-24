import 'package:flutter/material.dart';
import 'package:neuro_shop/core/extensions/localization_extension.dart';

import '../widgets/product_card.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});
  static const String name = "/cart-list";
  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localization.cartList),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: 6,
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
