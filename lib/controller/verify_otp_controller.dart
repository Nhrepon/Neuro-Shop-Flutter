import 'package:get/get.dart';
import 'package:neuro_shop/app/api_list.dart';
import 'package:neuro_shop/core/network_caller.dart';
import 'package:neuro_shop/model/sign_up_model.dart';
import 'package:neuro_shop/model/verify_otp_model.dart';

class VerifyOtpController extends GetxController {
  bool _progress = false;
  bool get progress => _progress;

  String? _message;
  String? get message => _message;

  Future<bool> verifyOtp(VerifyOtpModel verifyOtpModel) async {
    bool success = false;
    _progress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>()
        .postRequest(url: ApiList.verifyOtpUrl, body: verifyOtpModel.toJson());
    if(response.isSuccess){
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
