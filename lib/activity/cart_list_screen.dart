import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neuro_shop/activity/payment_screen.dart';
import 'package:neuro_shop/controller/cart_controller.dart';
import 'package:neuro_shop/core/extensions/localization_extension.dart';
import 'package:neuro_shop/model/cart_item_model.dart';

import '../app/app_colors.dart';
import '../widgets/cart_item.dart';
import '../widgets/sslcommerze_payment.dart';


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
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
      ),
      body: GetBuilder<CartController>(
        init: _cartController,
        builder: (controller) {
          if (controller.progress || controller.cartProgress) {
            return Center(child: CircularProgressIndicator());
          }
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: controller.cartList.length,
                    itemBuilder: (context, index) {
                      CartItemModel cartItem = controller.cartList[index];
                      return CartItem(cartItem: cartItem);
                    },
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    topLeft: Radius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text("Price: "),
                        Text(
                          "\$${controller.totalPrice}",
                          style: TextStyle(
                            color: AppColors.themeColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 140,
                      child: ElevatedButton(
                        onPressed: () async {
                          Get.snackbar("title", "Checkout");
                          SslcommerzePayment(controller.totalPrice.toDouble());
                          //Navigator.pushNamed(context, PaymentScreen.name, arguments: controller.totalPrice.toDouble());
                        },
                        child: Text("Checkout"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}


