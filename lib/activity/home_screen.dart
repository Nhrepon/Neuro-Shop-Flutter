import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:neuro_shop/activity/sign_in_screen.dart';
import 'package:neuro_shop/app/assets_path.dart';
import 'package:neuro_shop/controller/category_controller.dart';
import 'package:neuro_shop/controller/home_layout_controller.dart';
import 'package:neuro_shop/core/extensions/localization_extension.dart';
import 'package:neuro_shop/model/category_model.dart';
import 'package:neuro_shop/widgets/SnackBarMessage.dart';

import '../controller/auth_controller.dart';
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
  final AuthController _authController = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(AssetsPath.logoNav, width: 120),
        actions: [
          appBarActionButton(icon: Icons.person_outline, onTap: () {ShowSnackBarMessage(context, "User");}),
          SizedBox(width: 8),
          appBarActionButton(icon: Icons.search, onTap: () {ShowSnackBarMessage(context, "Search");}),
          SizedBox(width: 8),
          appBarActionButton(icon: Icons.settings, onTap: () {ShowSnackBarMessage(context, "Settings");}),
          SizedBox(width: 8),
          appBarActionButton(icon: Icons.logout, onTap: () async {await _authController.clearData();Navigator.pushNamedAndRemoveUntil(context, SignInScreen.name, (value)=>false);}),
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
              GetBuilder<CategoryController>(
                builder: (controller) {
                  if(controller.initialLoading) return Center(child: CircularProgressIndicator(),);

                  List<CategoryModel> list = controller.categoryList.length > 10
                      ? controller.categoryList.sublist(0, 10)
                      : controller.categoryList;

                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: list.map((e){
                          return CategoryItem(categoryModel: e);
                        }).toList()
                      ,
                    ),
                  );
                }
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
                spacing: 12,
                children: [
                  Text("Product"),
                  Text("Product"),
                  Text("Product"),
                  Text("Product"),
                  Text("Product"),
                  Text("Product"),
                  Text("Product"),

                ],
              ),
            );
  }
}

