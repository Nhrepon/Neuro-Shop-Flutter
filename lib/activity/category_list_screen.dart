import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:neuro_shop/controller/category_controller.dart';
import 'package:neuro_shop/controller/home_layout_controller.dart';
import 'package:neuro_shop/widgets/category_item.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  final CategoryController _categoryController = Get.find<CategoryController>();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_loadMoreData);
    // TODO: implement initState
    super.initState();
  }

  void _loadMoreData(){
    if(_scrollController.position.extentAfter > 200){
      _categoryController.getCategoryList();
    }
  }

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
        body: RefreshIndicator(
          onRefresh: () { return _categoryController.getCategoryList(); },
          child: GetBuilder<CategoryController>(
            builder: (controller) {
              if(controller.initialLoading){
                return Center(child: CircularProgressIndicator(),);
              }
              return Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        controller: _scrollController,
                        itemCount: controller.categoryList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 8,
                        ),
                        itemBuilder: (context, index) {
                          return FittedBox(
                            child: CategoryItem(categoryModel: controller.categoryList[index],),
                          );
                        },
                      ),
                    ),
                    Visibility(
                      visible: controller.progress,
                        child: LinearProgressIndicator())
                  ],
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}
