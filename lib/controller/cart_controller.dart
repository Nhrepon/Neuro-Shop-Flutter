import 'package:get/get.dart';
import 'package:neuro_shop/app/api_list.dart';
import 'package:neuro_shop/core/network_caller.dart';
import 'package:neuro_shop/model/cart_item_model.dart';

class CartController extends GetxController {
  bool _progress = false;

  bool get progress => _progress;

  bool _cartProgress = false;

  bool get cartProgress => _cartProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  List<CartItemModel> _cartList = [];

  List<CartItemModel> get cartList => _cartList;

  Future<bool> getCartList() async {
    bool isSuccess = false;
    _progress = true;

    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: ApiList.cartListUrl,
    );
    if (response.isSuccess) {
      List<CartItemModel> list = [];
      for (Map<String, dynamic> json
          in response.responseData!["data"]["results"]) {
        list.add(CartItemModel.fromJson(json));
      }
      _cartList = list;
      isSuccess = true;
      //debugPrint("\n\nCart List: ${_cartList[0].title}");
    } else {
      _errorMessage = response.errorMessage;
    }
    _progress = false;
    update();
    return isSuccess;
  }

  void updateCartProduct(String cartId, int quantity) {
    for (CartItemModel cartItemModel in _cartList) {
      if (cartItemModel.id == cartId) {
        cartItemModel.quantity = quantity;
        break;
      }
      update();
    }
  }

  Future<bool> removeFromCart(String cartId) async {
    bool isSuccess = false;
    _cartProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>()
        .deleteRequest(url: ApiList.removeCartUrl(cartId));
    if (response.isSuccess) {
      _cartList.removeWhere((e) => e.id == cartId);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _cartProgress = false;
    update();
    return isSuccess;
  }

  int get totalPrice {
    int total = 0;
    for (CartItemModel cartItemModel in _cartList) {
      total += (cartItemModel.price * cartItemModel.quantity);
    }
    return total;
  }
}
