import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neuro_shop/core/extensions/localization_extension.dart';

import '../widgets/product_card.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});
  static const String name = "/wish-list";
  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localization.wishList),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(CupertinoIcons.back),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: 15,
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
