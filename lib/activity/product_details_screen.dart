import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neuro_shop/activity/cart_list_screen.dart';
import 'package:neuro_shop/activity/sign_in_screen.dart';
import 'package:neuro_shop/app/app_colors.dart';
import 'package:neuro_shop/controller/add_to_cart_controller.dart';
import 'package:neuro_shop/controller/auth_controller.dart';
import 'package:neuro_shop/controller/product_details_controller.dart';
import 'package:neuro_shop/core/extensions/localization_extension.dart';
import 'package:neuro_shop/widgets/SnackBarMessage.dart';
import 'package:neuro_shop/widgets/product_increment_decrement.dart';
import 'package:neuro_shop/widgets/product_slider.dart';
import 'package:neuro_shop/widgets/size_picker.dart';

import '../widgets/color_picker.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  static const String name = "/product-details";

  final String productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final ProductDetailsController _productDetailsController = ProductDetailsController();
  final AddToCartController _addToCartController = AddToCartController();

  String? _selectedColor;
  String? _selectedSize;
  @override
  void initState() {
    // TODO: implement initState
    _productDetailsController.getProductDetails(widget.productId);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.localization.productDetails)),
      body: GetBuilder(
        init: _productDetailsController,
        builder: (controller) {
          if(controller.inProgress){
            return Center(child: CircularProgressIndicator(),);
          }
          if(controller.errorMessage != null){
            return Center(child: Text(controller.errorMessage!),);
          }
          return Column(
            children: [
              ProductSlider(imageList: controller.product.photos,),
              SizedBox(height: 12),
              Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 16,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.product.title,
                                      style: TextStyle(fontWeight: FontWeight.w600),
                                    ),
                                    Row(
                                      spacing: 4,
                                      children: [
                                        Icon(Icons.star,
                                          color: Colors.amber,
                                          size: 24,
                                        ),
                                        Text("${controller.product.rating}"),
                                        TextButton(onPressed: (){},
                                            child: Text("Reviews")
                                        ),
                                        Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(2),
                                          ),
                                          color: AppColors.themeColor,
                                          child: Padding(
                                            padding: EdgeInsets.all(3),
                                            child: Icon(
                                              Icons.favorite_border,
                                              size: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              ProductIncrementDecrement(
                                onChange: (int value) {
                                  print(value);
                                },
                              ),
                            ],
                          ),
                          ColorPicker(colors: controller.product.colors, onChange: (selectedColor){
                            _selectedColor = selectedColor;
                          },),
                          SizePicker(sizes: controller.product.sizes, onChange: (selectedSize){
                            _selectedSize = selectedSize;
                          }),
                          Text("Descriptions",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                          Text(controller.product.description,
                            style: TextStyle(color: Colors.grey),
                          )


                        ],
                      ),
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
                          "\$1000",
                          style: TextStyle(
                            color: AppColors.themeColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 140,
                      child: GetBuilder(
                        init: _addToCartController,
                        builder: (cont) {
                          return Visibility(
                            visible: cont.inProgress == false,
                            replacement: Center(child: CircularProgressIndicator(),),
                            child: ElevatedButton(
                              onPressed: () async {
                                if(controller.product.colors.isNotEmpty && _selectedColor == null){
                                  ShowSnackBarMessage(context, "Please, Select product color.");
                                  return;
                                }else if(controller.product.sizes.isNotEmpty && _selectedSize == null){
                                  ShowSnackBarMessage(context, "Please, Select product size.");
                                  return;
                                }else{
                                  if(Get.find<AuthController>().isValidUser() == false){
                                    Get.to(()=>SignInScreen());
                                    return;
                                  }
                                  final bool response = await _addToCartController.AddToCart(controller.product.id);
                                  if(response){
                                    ShowSnackBarMessage(context, "Add to cart success.");
                                    Get.to(()=>{CartListScreen});
                                  }else{
                                    ShowSnackBarMessage(context, "${_addToCartController.errorMessage}");
                                  }
                                }
                              },
                              child: Text("Add to cart"),
                            ),
                          );
                        }
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}


