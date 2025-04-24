import 'package:flutter/material.dart';
import 'package:neuro_shop/app/app_colors.dart';
import 'package:neuro_shop/core/extensions/localization_extension.dart';
import 'package:neuro_shop/widgets/product_increment_decrement.dart';
import 'package:neuro_shop/widgets/product_slider.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  static const String name = "/product-details";

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.localization.productDetails)),
      body: Column(
        children: [
          ProductSlider(),
          SizedBox(height: 12),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text("Nike 320 2025 new addition")],
                        ),
                      ),
                      ProductIncrementDecrement(
                        onChange: (int value) {
                          print(value);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8),
                topLeft: Radius.circular(8),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("Price: "),
                    Text(
                      "\$1000",
                      style: TextStyle(
                        color: AppColors.themeColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 140,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Add to cart"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
