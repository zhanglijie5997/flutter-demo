import 'package:flutter_app/utils/http/http.dart';



class IndexHttp {
  // 首页数据
  getIndexData() async{
    var data = await HttpInit.getInstance().httpGet("/index", {});
    return data;
  }
  // 新品上架
  getNewProduct() async {
    var data = await HttpInit.getInstance().httpGet("/newProduct", {});
    return data;
  }
}