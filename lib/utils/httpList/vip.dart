import 'package:flutter_app/utils/http/http.dart';

class VipHttp {
  getUser() async {
    var data = await HttpInit.getInstance().httpPost("/user", {});
    return data;
  }
}