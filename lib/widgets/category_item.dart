import 'package:flutter/material.dart';

import '../app/app_colors.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key, required this.title, required this.icon,
  });
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: EdgeInsets.all(8),
          color: AppColors.themeColor.withValues(alpha: 0.1),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Icon(
              icon,
              size: 60,
              color: AppColors.themeColor,
            ),
          ),
        ),
        Text(title, style: TextStyle(color: AppColors.themeColor, fontSize: 16, fontWeight: FontWeight.w500),)
      ],
    );
  }
}