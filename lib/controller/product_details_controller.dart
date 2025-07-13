import 'package:get/get.dart';
import 'package:neuro_shop/app/api_list.dart';
import 'package:neuro_shop/core/network_caller.dart';
import 'package:neuro_shop/model/product_model.dart';

class ProductDetailsController extends GetxController{
  bool _inProgress = false;
  late ProductModel _productModel;
  String? _errorMessage;
  
  bool get inProgress => _inProgress;
  ProductModel get product => _productModel;
  String? get errorMessage => _errorMessage;
  
  Future<bool> getProductDetails(String productId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(url: ApiList.productDetailsUrl(productId));
    if(response.isSuccess){
      _productModel = ProductModel.fromJson(response.responseData!["data"]);
      isSuccess = true;
      _errorMessage = null;
    }else{
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }



}