import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:neuro_shop/app/app_colors.dart';
import 'package:neuro_shop/app/assets_path.dart';
import 'package:neuro_shop/controller/home_layout_controller.dart';
import 'package:neuro_shop/core/extensions/localization_extension.dart';

import '../widgets/app_bar_action_button.dart';
import '../widgets/category_item.dart';
import '../widgets/product_card.dart';
import '../widgets/search_field.dart';
import '../widgets/section_header.dart';
import '../widgets/slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(AssetsPath.logoNav, width: 120),
        actions: [
          appBarActionButton(icon: Icons.person_outline, onTap: () {}),
          SizedBox(width: 8),
          appBarActionButton(icon: Icons.person_outline, onTap: () {}),
          SizedBox(width: 8),
          appBarActionButton(icon: Icons.person_outline, onTap: () {}),
          SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              SearchFieldWidget(),
              SizedBox(height: 16),
              SliderWidget(),
              SizedBox(height: 16),
              SectionHeader(title: context.localization.categories, onTap: () {
                Get.find<HomeLayoutController>().moveToCategory();
              },),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryItem(title: "Computer", icon: Icons.computer),
                    CategoryItem(
                      title: "Electronics",
                      icon: Icons.electric_car,
                    ),
                    CategoryItem(title: "Electronics", icon: Icons.phone),
                    CategoryItem(title: "Electronics", icon: Icons.motorcycle),
                    CategoryItem(title: "Electronics", icon: Icons.laptop),
                  ],
                ),
              ),
              SizedBox(height: 16),
              SectionHeader(title: context.localization.popular, onTap: () {}),
              _buildProductSection(),
              SectionHeader(title: context.localization.newProduct, onTap: () {}),
              _buildProductSection(),
              SectionHeader(title: context.localization.special, onTap: () {}),
              _buildProductSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductSection() {
    return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ProductCard(),
                  ProductCard(),
                  ProductCard(),
                  ProductCard(),
                  ProductCard(),
                ],
              ),
            );
  }
}

