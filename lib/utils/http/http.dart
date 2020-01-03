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
  ) ;
  Response response;
  Dio dio = Dio(_options);
  
  // get 请求
  Future httpGet(String url,Map<String, dynamic> params) async {
      response = await dio.get(url, queryParameters: params);
      final data = response.data.toString();
      return data;
  }
  // post 请求
  Future httpPost(String url, Map<String, dynamic> params) async{
    FormData formData = FormData.fromMap(params);
    response = await dio.post(url, data: formData, onSendProgress: (int sent, int total) {
      print('$sent $total');
    });
    return response.data.toString();
  }
}