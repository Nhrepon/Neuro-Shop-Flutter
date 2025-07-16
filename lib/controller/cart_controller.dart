import 'package:get/get.dart';
import 'package:neuro_shop/app/api_list.dart';
import 'package:neuro_shop/core/network_caller.dart';
import 'package:neuro_shop/model/cart_item_model.dart';

class CartController extends GetxController{
  bool _progress = false;
  bool get progress => _progress;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  List<CartItemModel> _cartList =[];
  List<CartItemModel> get cartList => _cartList;

  Future<bool> getCartList()async{
    bool isSuccess = false;
    _progress = true;

    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(url: ApiList.cartListUrl);
    if(response.isSuccess){
      List<CartItemModel> list = [];
      for(Map<String, dynamic> json in response.responseData!["data"]["result"]){
        list.add(CartItemModel.fromJson(json));
      }
      _cartList = list;
      isSuccess = true;

    }else{
      _errorMessage = response.errorMessage;
    }
    _progress = false;
    update();
    return isSuccess;
  }
}