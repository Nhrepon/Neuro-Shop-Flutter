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
        builder: (controller) {
          List cartList = controller.cartList;
          if(controller.progress){
            return Center(child: CircularProgressIndicator(),);
          }
          return Padding(
            padding: EdgeInsets.all(16),
            child: ListView.builder(
              itemCount: cartList.length,
              itemBuilder: (context, index) {
                CartItemModel cartItem = cartList[index];
                return Card(
                  child: Row(children: [
                  Image.network("",width: 100, height: 100, errorBuilder: (_, __, ___){
                    return Icon(Icons.error_outline);
                  },),
                  Expanded(
                    child: Column(children: [
                      Text(cartItem.productModel.title),
                      Row(children: [
                        Text(cartItem.color),
                        Text(cartItem.size),
                      ],)
                    ],),
                  ),
                  Column(children: [

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
