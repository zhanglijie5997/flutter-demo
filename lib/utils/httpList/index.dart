import 'package:flutter_app/utils/http/http.dart';

class IndexHttp {
  getIndexData() async{
    var data = await HttpInit.getInstance().httpGet("/index", {});
    return data;
  }
}