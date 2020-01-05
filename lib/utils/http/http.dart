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
    baseUrl: "http://localhost:3000",
    connectTimeout: 5000,
    receiveTimeout: 3000,
    headers: {
      HttpHeaders.contentTypeHeader: "*"
    }
  ) ;
  Response response;
  Dio dio = Dio(_options);
  
  // get 请求
  httpGet(String url,Map<String, dynamic> params) async {
      response = await dio.get(url, queryParameters: params);
      final data = response.data;
      return data;
  }
  // post 请求
  httpPost(String url, Map<String, dynamic> params) async{
    // FormData formData = FormData.fromMap(params);
    print(params);
    response = await dio.post(url, data: params, onSendProgress: (int sent, int total) {
      // print('$sent $total');
    });
    return response.data;
  }
}