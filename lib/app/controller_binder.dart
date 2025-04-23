import 'package:get/get.dart';
import 'package:neuro_shop/controller/home_layout_controller.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(HomeLayoutController());
  }
}