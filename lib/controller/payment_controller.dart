import 'package:get/get.dart';

import '../core/network_caller.dart';

class PaymentController extends GetxController{
  String initUrl = "https://sandbox.sslcommerz.com/gwprocess/v4/api.php";

  Future<bool> paymentRequest(String total) async {
    Map<String, dynamic> paymentSetting = {
      'store_id':"teamr600c004f8da4d",
      'store_passwd':"teamr600c004f8da4d@ssl",
      'total_amount':total,
      'currency':"BDT",
      'tran_id':"neuro-shop-$total",
    };
    bool success = false;
    update();

    final NetworkResponse response = await Get.find<NetworkCaller>()
        .postRequest(url: initUrl, body: paymentSetting);
    if(response.isSuccess){
      success = true;
      update();
    }else{;
      success = false;
      update();
    }
    return success;
  }

}