
import 'package:get/get.dart';
import 'package:neuro_shop/app/api_list.dart';
import 'package:neuro_shop/controller/auth_controller.dart';
import 'package:neuro_shop/core/network_caller.dart';
import 'package:neuro_shop/model/user_model.dart';

class LoginController extends GetxController {
  bool _progress = false;
  bool get progress => _progress;

  String? _message;
  String? get message => _message;

  Future<bool> login(String email, String password) async {
    bool success = false;
    _progress = true;
    update();
    //Map<String, String> reqBody = {"email":email, "password":password};
    final NetworkResponse response = await Get.find<NetworkCaller>()
        .postRequest(url: ApiList.loginUrl, body: {"email":email, "password":password});
    if(response.isSuccess){
      success = true;
      _progress = false;

      UserModel userModel = UserModel.fromJson(response.responseData!['data']['user']);
      String token = response.responseData!['data']['token'];
      await Get.find<AuthController>().saveUserData(token, userModel);

      _message = await response.responseData?["msg"];
      update();
    }else{
      success = false;
      _progress = false;
      _message = await response.responseData?["msg"];
      update();
    }
    return success;
  }
}
