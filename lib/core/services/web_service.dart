import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce/core/constants/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'dart:core';
import '../../main.dart';

class WebService {

  static WebService? _this;
  factory WebService() {
    _this ??= WebService._();
    return _this!;
  }


  Dio freeDio = Dio();
  Dio tokenDio = Dio();
  String? myToken;
  String lang ="en";
  String? nonce;
  final String storageKeyMobileToken="Authorization";


  WebService._() {
    freeDio.options.connectTimeout = const Duration(seconds: 30000);
    freeDio.options.baseUrl = Constants.domain;
    tokenDio.options.connectTimeout = const Duration(seconds: 30000);
    tokenDio.options.baseUrl = Constants.domain;
    initializeInterceptors();
  }
  initializeInterceptors() {
    freeDio.interceptors.clear;
    tokenDio.interceptors.clear;
    freeDio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers["Accept Language"] =
          navigatorKey.currentContext!.locale;

          debugPrint("send request : baseUrl : ${options.baseUrl} path : ${options.path}");
          debugPrint("headers : ${options.headers}");
          debugPrint("query parameters : ${options.queryParameters}");
          debugPrint("data : ${options.data}");
          return handler.next(options);
        },
        onResponse: (response,handler) {
          debugPrint("states code : ${response.statusCode}");
          debugPrint("data: ${response.data}");
          log(response.data.toString());
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          debugPrint("status code : ${e.response?.statusCode}");
          debugPrint("path : ${e.requestOptions.path}");
          debugPrint("response : ${e.response}");
          debugPrint("data : ${e.response?.data}");
          debugPrint("error : ${e.error}");
          debugPrint("message : ${e.message}");
          debugPrint("type : ${e.type}");

          EasyLoading.dismiss();

          return handler.next(e);
        },
      ),
    );
    tokenDio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers["Authorization"] ="Bearer $myToken";

          debugPrint("send request : baseUrl : ${options.baseUrl} path : ${options.path}");
          debugPrint("headers : ${options.headers}");
          debugPrint("query parameters : ${options.queryParameters}");
          debugPrint("data : ${options.data}");
          return handler.next(options);
        },
        onResponse: (response,handler) {
          debugPrint("states code : ${response.statusCode}");
          debugPrint("data: ${response.data}");
          log(response.data.toString());
          return handler.next(response);
        },
        onError: (DioException e, handler) async{
          EasyLoading.dismiss();
          // if(e.response!=null){
          //   if(e.response!.statusCode==401 || e.response!.statusCode==403){
          //     CachHelper.removeKey(storageKeyMobileToken);
          //     ConfigrationCubit.get(NavigatorKey.currentState!.context).checkUserLogin();
          //
          //   }else{
          //     return handler.next(e);
          //   }
          // }else{
          //   return handler.next(e);
          // }
          debugPrint("status code : ${e.response?.statusCode}");
          debugPrint("path : ${e.requestOptions.path}");
          debugPrint("response : ${e.response}");
          debugPrint("data : ${e.response?.data}");
          debugPrint("error : ${e.error}");
          debugPrint("message : ${e.message}");
          debugPrint("type : ${e.type}");

          EasyLoading.dismiss();

          return handler.next(e);
        },
      ),
    );
  }
}
