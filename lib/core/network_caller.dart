import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:get/get.dart' as getx;
import 'package:neuro_shop/controller/auth_controller.dart';

class NetworkResponse {
  final int statusCode;
  final Map<String, dynamic>? responseData;
  final bool isSuccess;
  final String errorMessage;

  NetworkResponse({
    required this.isSuccess,
    required this.statusCode,
    this.responseData,
    this.errorMessage = 'Something went wrong!',
  });
}

class NetworkCaller {

  final Logger _logger = Logger();

  Future<NetworkResponse> getRequest({required String url, Map<String, dynamic>? queryParams}) async {
    await getx.Get.find<AuthController>().getUserData();
    try {
      if(queryParams != null){
        url += '?';
        for(String key in queryParams.keys ?? {}){
          url += "$key=${queryParams[key]}&";
        }
      }
      Uri uri = Uri.parse(url);
      Map<String, String> headers = {'token': getx.Get.find<AuthController>().token ?? ""};
      _logRequest(url, headers);
      Response response = await get(uri, headers: headers);
      _logResponse(url, response);

      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData: decodedResponse,
        );
      } else if (response.statusCode == 401) {
        await _logout();
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> postRequest({required String url, Map<String, dynamic>? body,}) async {
    await getx.Get.find<AuthController>().getUserData();
    try {
      Uri uri = Uri.parse(url);
      debugPrint('URL => $url');
      debugPrint('BODY => $body');
      Response response = await post(
        uri,
        headers: {'content-type': 'application/json', 'token': getx.Get.find<AuthController>().token ?? ""},
        body: jsonEncode(body),
      );
      debugPrint('Response Code => ${response.statusCode}');
      debugPrint('Response Data => ${response.body}');
      if (response.statusCode == 200 || jsonDecode(response.body)["status"] == "success") {
        final decodedResponse = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData: decodedResponse,
        );
      } else if (response.statusCode == 401) {
        await _logout();
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }



  Future<NetworkResponse> deleteRequest(
      {required String url, Map<String, dynamic>? body}) async {
    try {
      Uri uri = Uri.parse(url);
      Map<String, String> headers = {
        'content-type': 'application/json',
        'token': getx.Get.find<AuthController>().token ?? ''
      };

      _logRequest(url, headers);
      Response response =
      await delete(uri, headers: headers, body: jsonEncode(body));
      _logResponse(url, response);

      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body);
        return NetworkResponse(
            isSuccess: true,
            statusCode: response.statusCode,
            responseData: decodedResponse);
      } else if (response.statusCode == 401) {
        return NetworkResponse(
            isSuccess: false, statusCode: response.statusCode);
      } else {
        return NetworkResponse(
            isSuccess: false, statusCode: response.statusCode);
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }



  static Future<void> _logout() async {
    //await AuthController.clearUserData();
    // Navigator.pushNamedAndRemoveUntil(
    //     //NeuroShop.navigatorKey.currentContext!,
    //     //SignInScreen.name,
    //     //(_) => false
    // );
  }




  void _logRequest(String url, Map<String, dynamic> headers, {Map<String, dynamic>? requestBody}){
    _logger.i("Url = $url\nHeaders: $headers\nBody: $requestBody");
  }

  void _logResponse(String url, Response response){
    _logger.i("Url = $url\nStatus Code: ${response.statusCode}\nHeaders: ${response.headers}\nBody: ${response.body}");
  }
}
