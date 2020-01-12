import 'dart:io';

import 'package:dio/dio.dart';

class HttpInit {
  HttpInit._();
  static HttpInit _instance;
  static HttpInit getInstance() {
    if(_instance == null) {
      _instance = HttpInit._();
    }
    return _instance;
  }
  static BaseOptions _options = BaseOptions(
    baseUrl: "http://192.168.0.186:3000",
    connectTimeout: 5000,
    receiveTimeout: 3000,
    headers: {
      HttpHeaders.contentTypeHeader: "*"
    }
  ) ;
  Response response;
  Dio dio = Dio(_options);
  
  setDio() {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) {
        options.headers["token"] = "zhanglijie";
        // 设置请求头
        return options;
      },
      onResponse: (Response response) {
        return response;
      },
      onError: (DioError err) async {
        return err;
      }
    ));
  }
  
  // get 请求
  httpGet(String url,Map<String, dynamic> params) async {
      await setDio();
      response = await dio.get(url, queryParameters: params);
      final data = response.data;
//      print(data);
      return data;
  }
  // post 请求
  httpPost(String url, Map<String, dynamic> params) async{
    await setDio();
    // FormData formData = FormData.fromMap(params);
    print(params);
    response = await dio.post(url, data: params, onSendProgress: (int sent, int total) {
      // print('$sent $total');
    });
    return response.data;
  }
}