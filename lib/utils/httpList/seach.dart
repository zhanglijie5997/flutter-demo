import 'package:flutter_app/utils/http/http.dart';
class SeachHttpList {
  /// 搜索
  /// context 搜索内容
  getSeach(String context) async{
    var data = await HttpInit.getInstance().httpPost("/seach", {
      "context": context
    });
    return data;
  }
}