import 'package:flutter_app/utils/http/http.dart';

class ReversionHttpList {
  getReversionIndex(int type) async{
    var data = await HttpInit.getInstance().httpGet("/reversionIndex", {"type": type});
    return data;
  }
}