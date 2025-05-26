import 'package:get/get.dart';
import 'package:neuro_shop/app/api_list.dart';
import 'package:neuro_shop/core/network_caller.dart';
import 'package:neuro_shop/model/sign_up_model.dart';

class SignUpController extends GetxController {
  bool _progress = false;
  bool get signUpInProgress => _progress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> signUp(SignUpModel signUpModel) async {
    bool isSuccess = false;
    _progress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>()
        .postRequest(url: ApiList.signUpUrl, body: signUpModel.toJson());
    if(response.isSuccess){
      _errorMessage = null;
      isSuccess = true;
    }else{
      _errorMessage = response.responseData?["msg"];
      isSuccess = false;
    }
    return isSuccess;
  }
}
