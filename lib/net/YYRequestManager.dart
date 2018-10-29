import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';

import 'dart:collection';

import 'package:ly_app/net/YYResultModel.dart';
import 'package:ly_app/net/YYResultCode.dart';
import 'package:ly_app/config/YYConfig.dart';

class YYRequestManager {
  static String baseUrl = "http://cfpapp.zhengheht.com/cfpapp";
  static Map<String, String> baseHeaders = {
    "packageName":"com.puxin.financePlanner",
    "appName":"FinancialPlanner",
    "version":"1.8.7.3",
    "os":"ios",
    "channel":"appStore",
    "platform":"11.1999998092651",
    "model":"",
    "factory":"apple",
    "screenSize":"(0.0, 0.0, 375.0, 667.0)",
    "clientId":"15444",
    "token":"2c7019f13c2b4a8789e8fc62e9b53827812a0048b837402b988033ef22f706b2",
    "sign":"",
    "pid":"pid",
    "registrationId":"pid",
  };

  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";
  static Map optionParams = {
    "timeoutMs": 15000,
    "token": null,
    "authorizationCode": null,
  };

  static requestPost(url, params, {noTip = false}) async {
    Options option = new Options(method: "post");
    return await requestBase(url, params, baseHeaders, option, noTip: noTip);
  }

  static requestBase(url, params, Map<String, String>header, Options option, {noTip = false}) async {
    // 判断网络
    var connectivityResult = await (new Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {

    } else if (connectivityResult == ConnectivityResult.wifi) {
      
    } else if (connectivityResult == ConnectivityResult.none){
      return YYResultModel(YYResultErrorEvent(YYResultCode.NETWORK_ERROR, "请检查网络"), false, YYResultCode.NETWORK_ERROR);
    }

    //处理请求头
    Map<String, String> headers = new HashMap();
    if (header!=null) {
      headers.addAll(header);
    }

    //options处理
    if (option != null) {
      option.headers = headers;
    } else{
      option = new Options(method: "get");
      option.headers = headers;
    }
    option.baseUrl = baseUrl;
    option.connectTimeout = 15000;

    var dio = new Dio();
    Response response;
    try {
      response = await dio.request(url, data: params, options: option);
    } on DioError catch (error) {
      // 请求错误处理
      Response errorResponse;
      if (error.response != null) {
        errorResponse = error.response;
      } else {
        errorResponse = new Response(statusCode: 666);
      }
      // 超时
      if (error.type == DioErrorType.CONNECT_TIMEOUT) {
        errorResponse.statusCode = YYResultCode.NETWORK_TIMEOUT;
      }
      // debug模式才打印
      if (YYConfig.DEBUG) {
        print('请求异常: ' + error.toString());
        print('请求异常url: ' + url);
        print('请求头: ' + option.headers.toString());
        print('method: ' + option.method);
      }
      // 返回错误信息
      return new YYResultModel(YYResultCode.errorHandleFunction(errorResponse.statusCode, error.message, noTip), false, errorResponse.statusCode);
     };

    // debug模式打印相关数据
    if (YYConfig.DEBUG) {
      print('请求url: ' + url);
      print('请求头: ' + option.headers.toString());
      if (params != null) {
        print('请求参数: ' + params.toString());
      }
      if (response != null) {
        print('返回参数: ' + response.toString());
      }
    }

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return new YYResultModel(response.data, true, YYResultCode.SUCCESS, headers: response.headers);
      }
    } catch (error) {
      print(error.toString() + url);
      return new YYResultModel(response.data, false, response.statusCode, headers: response.headers);
    }
    return new YYResultModel(YYResultCode.errorHandleFunction(response.statusCode, "", noTip), false, response.statusCode);
  }
}