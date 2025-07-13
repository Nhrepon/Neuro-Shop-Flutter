import 'package:flutter/material.dart';
import 'package:neuro_shop/activity/product_details_screen.dart';
import 'package:neuro_shop/model/product_model.dart';

import '../app/app_colors.dart';
import '../app/assets_path.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key, required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductDetailsScreen.name, arguments: productModel.id);
      },
      child: Card(
        //margin: EdgeInsets.all(4),
        color: Colors.white,
        child: SizedBox(
          width: 180,
          child: Column(
            children: [
              Container(
                height: 120,
                width: 180,
                decoration: BoxDecoration(
                  color: AppColors.themeColor.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  image: productModel.photos.isNotEmpty ? DecorationImage(
                    image: NetworkImage(productModel.photos.first),
                    fit: BoxFit.cover,
                  ): null,
                ),
                child: productModel.photos.isEmpty ? Icon(Icons.error):null,
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productModel.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${productModel.currentPrice}৳",
                          style: TextStyle(
                            color: AppColors.themeColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Wrap(children: [Icon(Icons.star, size: 18, color: Colors.orange), Text("${productModel.rating}")]),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2),
                          ),
                          color: AppColors.themeColor,
                          child: Padding(
                            padding: EdgeInsets.all(3),
                            child: Icon(
                              Icons.favorite_border,
                              size: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
