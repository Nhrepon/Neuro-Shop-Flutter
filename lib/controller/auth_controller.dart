import 'dart:convert';

import 'package:neuro_shop/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController{
  final String _tokenKey = 'token';
  final String _userDataKey = 'user-data';
  String? token;
  UserModel? user;
  Future<void> saveUserData(String token, UserModel userModel)async{
     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
     sharedPreferences.setString(_tokenKey, token);
     sharedPreferences.setString(_userDataKey, jsonEncode(userModel.toJson()));

     token = token;
     user = userModel;

  }

  Future<void> getUserData()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString(_tokenKey);
    String? userData = sharedPreferences.getString(_userDataKey);
    if(userData != null){
      user = UserModel.fromJson(jsonDecode(userData));
    }
  }


  Future<bool> isLogin()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = await sharedPreferences.getString(_tokenKey);
    if(token != null){
      return true;
    }
    return false;

  }



  Future<void> clearData()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    token = null;
    user = null;
  }

  bool isValidUser(){
    return token != null;
  }

}