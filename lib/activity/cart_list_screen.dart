import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neuro_shop/controller/cart_controller.dart';
import 'package:neuro_shop/core/extensions/localization_extension.dart';
import 'package:neuro_shop/model/cart_item_model.dart';

import '../widgets/product_card.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});
  static const String name = "/cart-list";
  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  final CartController _cartController = Get.find<CartController>();
  @override
  void initState() {
    _cartController.getCartList();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localization.cartList),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: GetBuilder<CartController>(
        init: _cartController,
        builder: (controller) {
          if(controller.progress){
            return Center(child: CircularProgressIndicator(),);
          }
          return Padding(
            padding: EdgeInsets.all(16),
            child: ListView.builder(
              itemCount: controller.cartList.length,
              itemBuilder: (context, index) {
                CartItemModel cartItem = controller.cartList[index];
                return Card(
                  child: Row(
                    spacing: 8,
                    children: [
                  Image.network("",width: 100, height: 100, errorBuilder: (_, __, ___){
                    return Icon(Icons.error_outline);
                  },),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text(cartItem.title ?? ""),
                      Row(spacing:8,
                        children: [
                        Text("Color: ${cartItem.color ?? ""}"),
                        Text("Size: ${cartItem.size}"),
                      ],)
                    ],),
                  ),
                  Column(children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.delete))
                  ],)
                ],),);
              },
            ),
          );
        }
      ),
    );
  }
}
