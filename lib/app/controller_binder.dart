import 'package:get/get.dart';
import 'package:neuro_shop/controller/home_layout_controller.dart';
import 'package:neuro_shop/controller/sign_up_controller.dart';
import 'package:neuro_shop/core/network_caller.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(NetworkCaller());
    Get.put(HomeLayoutController());
    Get.put(SignUpController());
  }
}