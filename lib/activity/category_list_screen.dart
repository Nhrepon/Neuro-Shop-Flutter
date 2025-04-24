import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:neuro_shop/controller/home_layout_controller.dart';
import 'package:neuro_shop/widgets/category_item.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_,__){
        Get.find<HomeLayoutController>().moveToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Categories"),
          leading: IconButton(onPressed: (){Get.find<HomeLayoutController>().moveToHome();}, icon: Icon(CupertinoIcons.back))
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: GridView.builder(
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              return const FittedBox(
                child: CategoryItem(title:"Computer", icon: Icons.computer),
              );
            },
          ),
        ),
      ),
    );
  }
}
