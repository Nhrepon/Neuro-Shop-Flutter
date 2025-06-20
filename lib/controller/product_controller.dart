import 'package:get/get.dart';
import 'package:neuro_shop/model/product_model.dart';
import '../app/api_list.dart';
import '../core/network_caller.dart';

class ProductController extends GetxController{
  bool _initialLoading = true;
  bool get initialLoading => _initialLoading;

  bool _progress = false;
  bool get progress => _progress;

  String? _message;
  String? get message => _message;

  int _pageNo = 0;
  final int _perPage = 20;
  int? _total;
  int? get totalPage => _total;

  List<ProductModel> _productList = [];
  List<ProductModel> get productList => _productList;

  Future<bool> getProductList(String categoryId) async {
    if(_total != null && _pageNo > _total!) return true;

    bool success = false;
    _pageNo++;
    if(!_initialLoading){
      _progress = true;
    }
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .getRequest(url: ApiList.productListUrl, queryParams: {"category":categoryId,"count": _perPage, "page": _pageNo});
    if(response.isSuccess){
      List<ProductModel> list = [];
      for(Map<String, dynamic> data in response.responseData?['data']['results']){
        list.add(ProductModel.fromJson(data));
      }
      _productList.addAll(list);
      _total = response.responseData?['data']['last_page'];
      _message = response.responseData?["msg"];;
      success = true;
      !_initialLoading ? _progress = false : _initialLoading = false;
      update();
    }else{
      _message = response.responseData?["msg"];
      success = false;
      _progress = false;
      update();
    }
    return success;
  }



  Future<bool> initialLoad(String categoryId){
    _pageNo = 0;
    _productList = [];
    _initialLoading = true;
    return getProductList(categoryId);
  }


}