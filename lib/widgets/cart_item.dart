import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neuro_shop/controller/cart_controller.dart';
import 'package:neuro_shop/widgets/product_increment_decrement.dart';

import '../app/app_colors.dart';
import '../model/cart_item_model.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.cartItem,
  });

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 12),
      shadowColor: AppColors.themeColor,

      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          spacing: 16,
          children: [
            Image.network(
              cartItem.photo ?? "https://opsg-img-cdn-gl.heytapimg.com/epb/202501/02/zDc3USjyFOIYnO3M.jpg",
              width: 100,
              // height: 100,
              errorBuilder: (_, __, ___) {
                return Icon(Icons.error_outline);
              },
              fit: BoxFit.cover,

            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 4,
                children: [
                  Text(
                    cartItem.title ?? "",
                    style: TextStyle(fontSize: 18),
                  ),
                  Row(
                    spacing: 8,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 4,
                        children: [
                          Text(
                            "Color: ${cartItem.color ?? ""}",
                          ),
                          Text(
                            "Size: ${cartItem.size ?? ""}",
                          ),
                          Text(
                            "Quantity: ${cartItem.quantity ?? 1}",
                          ),
                          Text(
                            "Price: \$${cartItem.price}",
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Visibility(
                            visible: Get.find<CartController>().cartProgress == false,
                            replacement: Center(child: CircularProgressIndicator(),),
                            child: IconButton(
                              onPressed: () async {
                                final bool isSuccess = await Get.find<CartController>().removeFromCart(cartItem.id);
                                if(isSuccess){
                                  Get.snackbar("Remove item", "Deleted item from cart",
                                    backgroundColor: AppColors.themeColor.withAlpha(150),
                                    colorText: Colors.white,
                                    icon: Icon(Icons.warning, color: Colors.red),
                                    snackPosition: SnackPosition.TOP,
                                    margin: EdgeInsets.all(16),
                                    padding: EdgeInsets.all(16),
                                    titleText: Text("Delete Item?", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                                    messageText: Text("Deleted item successfully", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                                    duration: Duration(seconds: 3),
                                    showProgressIndicator: true,
                                    shouldIconPulse: true,


                                  );
                                }else{
                                  Get.snackbar("Failed", "Delete item failed");
                                }
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 32,
                              ),
                            ),
                          ),
                          ProductIncrementDecrement(
                            onChange: (int count) {
                              Get.find<CartController>().updateCartProduct(cartItem.id, count);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}