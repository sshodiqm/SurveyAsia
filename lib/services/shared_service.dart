import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:survei_asia/models/city.dart';
import 'package:survei_asia/models/districs.dart';
import 'package:survei_asia/models/response_get_userinfo_model.dart';
import 'package:survei_asia/models/response_model.dart';

import '../models/province.dart';
import '../models/response_userinfo_model.dart';

class SharedService {
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isLogin") ?? false;
  }

  static Future<void> setIsLoggedIn(bool loginStatus) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLogin", loginStatus);
  }

  static Future<ResponseModel?> loginDetails() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("login_details") != null
        ? ResponseModel.fromJson(jsonDecode(prefs.getString("login_details")!))
        : null;
  }

  static Future<void> setLoginDetails(ResponseModel model) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("login_details", jsonEncode(model.toJson()));
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("isLogin");
    await prefs.remove("login_details");
    await prefs.remove("is_filled");
    await prefs.remove("user_info");
    await prefs.remove("user_province");
    await prefs.remove("user_city");
    await prefs.remove("user_districs");
  }

  static Future<void> setOnBoardingPageShown(bool status) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("onBoardingShown", status);
  }

  static Future<bool> checkOnBoarding() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("onBoardingShown") != null ? true : false;
  }

  static Future<bool> isFilledPersonalInformation() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("is_filled") != null ? true : false;
  }

  static Future<void> setIsFilledPersonalInformation(bool fillStatus) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("is_filled", fillStatus);
  }

  // static Future<ResponseUserinfoModel?> userInfo() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   return prefs.getString("user_info") != null
  //       ? ResponseUserinfoModel.fromJson(
  //           jsonDecode(prefs.getString("user_info")!))
  //       : null;
  // }

  static Future<ResponseGetUserinfoModel?> userInfo() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("user_info") != null
        ? ResponseGetUserinfoModel.fromJson(
            jsonDecode(prefs.getString("user_info")!))
        : null;
  }

  static Future<void> setUserInfo(ResponseGetUserinfoModel model) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("user_info", jsonEncode(model.toJson()));
  }

  static Future<void> setProvince(Province model) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("user_province", jsonEncode(model.toJson()));
  }

  static Future<void> setCity(City model) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("user_city", jsonEncode(model.toJson()));
  }

  static Future<void> setDistrics(Districs model) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("user_districs", jsonEncode(model.toJson()));
  }

  static Future<Province?> userProvince() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("user_province") != null
        ? Province.fromJson(jsonDecode(prefs.getString("user_province")!))
        : null;
  }

  static Future<City?> userCity() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("user_city") != null
        ? City.fromJson(jsonDecode(prefs.getString("user_city")!))
        : null;
  }

  static Future<Districs?> userDistrics() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("user_districs") != null
        ? Districs.fromJson(jsonDecode(prefs.getString("user_districs")!))
        : null;
  }
}
