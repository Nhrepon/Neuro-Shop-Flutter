import 'package:flutter/material.dart';
import 'package:neuro_shop/activity/product_list_screen.dart';
import 'package:neuro_shop/model/category_model.dart';

import '../app/app_colors.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.categoryModel});

  // final String title;
  // final IconData icon;
  
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductListScreen.name, arguments: categoryModel.title);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4,
        children: [
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            margin: EdgeInsets.only(right: 16),
            color: Colors.grey.shade200,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Image.network(categoryModel.icon, width: 48, height: 48,),
            ),
          ),
          Text(
            categoryModel.title,
            style: TextStyle(
              color: AppColors.themeColor,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
