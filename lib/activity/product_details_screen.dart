import 'package:flutter/material.dart';
import 'package:neuro_shop/app/app_colors.dart';
import 'package:neuro_shop/core/extensions/localization_extension.dart';
import 'package:neuro_shop/widgets/product_increment_decrement.dart';
import 'package:neuro_shop/widgets/product_slider.dart';
import 'package:neuro_shop/widgets/size_picker.dart';

import '../widgets/color_picker.dart';

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
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 16,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Nike 320 2025 new addition",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                Row(
                                  spacing: 4,
                                  children: [
                                    Icon(Icons.star,
                                      color: Colors.amber,
                                      size: 24,
                                    ),
                                    Text("4.2"),
                                    TextButton(onPressed: (){},
                                        child: Text("Reviews")
                                    ),
                                    Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                      color: AppColors.themeColor,
                                      child: Padding(
                                        padding: EdgeInsets.all(3),
                                        child: Icon(
                                          Icons.favorite_border,
                                          size: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          ProductIncrementDecrement(
                            onChange: (int value) {
                              print(value);
                            },
                          ),
                        ],
                      ),
                      ColorPicker(colors: ['Red', 'Green', 'Yellow', 'Black', ], onChange: (selectedColor){
                        print(selectedColor);
                      },),
                      SizePicker(sizes: ['M','L', 'XL', 'XX'], onChange: (selectedSize){
                        print(selectedSize);
                      }),
                      Text("Descriptions",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                      Text("What is Lorem Ipsum? Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                        style: TextStyle(color: Colors.grey),
                      )


                    ],
                  ),
                ),
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


