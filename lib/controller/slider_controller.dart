import 'package:get/get.dart';
import 'package:neuro_shop/app/api_list.dart';
import 'package:neuro_shop/core/network_caller.dart';
import 'package:neuro_shop/model/slider_model.dart';

class SliderController extends GetxController {
  bool _progress = false;
  bool get progress => _progress;

  String? _message;
  String? get message => _message;

  List<SliderModel> _sliderList = [];
  List<SliderModel> get sliders => _sliderList;

  Future<bool> getSlider() async {
    bool success = false;
    _progress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>()
        .getRequest(url: ApiList.sliderUrl);

    if(response.isSuccess){
      List<SliderModel> list = [];
      for(Map<String, dynamic> data in response.responseData?['data']['results']){
        list.add(SliderModel.fromJson(data));
      }
      _sliderList = list;
      _message = response.responseData?["msg"];;
      success = true;
      _progress = false;
      update();
    }else{
      _message = response.responseData?["msg"];
      success = false;
      _progress = false;
      update();
    }
    return success;
  }
}
