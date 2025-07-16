import 'package:get/get.dart';
import 'package:neuro_shop/controller/auth_controller.dart';
import 'package:neuro_shop/controller/cart_controller.dart';
import 'package:neuro_shop/controller/category_controller.dart';
import 'package:neuro_shop/controller/home_layout_controller.dart';
import 'package:neuro_shop/controller/login_controller.dart';
import 'package:neuro_shop/controller/sign_up_controller.dart';
import 'package:neuro_shop/controller/slider_controller.dart';
import 'package:neuro_shop/controller/verify_otp_controller.dart';
import 'package:neuro_shop/core/network_caller.dart';


class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(AuthController());
    Get.put(NetworkCaller());
    Get.put(HomeLayoutController());
    Get.put(SignUpController());
    Get.put(LoginController());
    Get.lazyPut(()=>VerifyOtpController());
    Get.put(LoginController());
    Get.put(SliderController());
    Get.put(CategoryController());
    Get.put(CartController());
    //Get.put(ProductDetailsController());

  }
}