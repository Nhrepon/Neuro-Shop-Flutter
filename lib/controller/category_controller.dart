import 'package:get/get.dart';
import 'package:neuro_shop/model/category_model.dart';

import '../app/api_list.dart';
import '../core/network_caller.dart';

class CategoryController extends GetxController{
  bool _initialLoading = true;
  bool get initialLoading => _initialLoading;

  bool _progress = false;
  bool get progress => _progress;

  String? _message;
  String? get message => _message;

  int _pageNo = 0;
  final int _perPage = 12;
  int? _total;
  int? get totalPage => _total;

  List<CategoryModel> _categoryList = [];
  List<CategoryModel> get categoryList => _categoryList;

  Future<bool> getCategoryList() async {
    if(_total != null && _pageNo > _total!) return true;

    bool success = false;
    _pageNo++;
    if(!_initialLoading){
      _progress = true;
    }
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .getRequest(url: ApiList.categoryUrl, queryParams: {"count": _perPage, "page": _pageNo});
    if(response.isSuccess){
      List<CategoryModel> list = [];
      for(Map<String, dynamic> data in response.responseData?['data']['results']){
        list.add(CategoryModel.fromJson(data));
      }
      _categoryList.addAll(list);
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
  Future<bool> initialLoad(){
    _pageNo = 0;
    _categoryList = [];
    _initialLoading = true;
    return getCategoryList();
  }
}