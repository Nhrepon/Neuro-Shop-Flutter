import 'package:get/get.dart';
import 'package:neuro_shop/app/api_list.dart';
import 'package:neuro_shop/core/network_caller.dart';
import 'package:neuro_shop/model/sign_up_model.dart';

class SignUpController extends GetxController {
  bool _progress = false;
  bool get signUpInProgress => _progress;

  String? _message;
  String? get message => _message;

  Future<bool> signUp(SignUpModel signUpModel) async {
    bool success = false;
    _progress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>()
        .postRequest(url: ApiList.signUpUrl, body: signUpModel.toJson());
    if(response.isSuccess){
      success = true;
      _progress = false;
      update();
      _message = await response.responseData?["msg"];
    }else{
      success = false;
      _progress = false;
      update();
      _message = await response.responseData?["msg"];
    }
    return success;
  }
}
