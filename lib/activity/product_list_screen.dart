import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neuro_shop/controller/product_controller.dart';
import 'package:neuro_shop/model/category_model.dart';
import 'package:neuro_shop/widgets/product_card.dart';


class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.category});
  final CategoryModel category;

  static const String name = "/product-list";

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ProductController _productController = ProductController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _productController.getProductList(widget.category.id);
    _scrollController.addListener(_loadData);
  }

  void _loadData(){
    if(_scrollController.position.extentBefore < 300){
      _productController.getProductList(widget.category.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.title),
      ),
      body: GetBuilder(
        init: _productController,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.all(16),
            child: GridView.builder(
              controller: _scrollController,
              itemCount: _productController.productList.length,
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
          );
        }
      ),
    );
  }
}
