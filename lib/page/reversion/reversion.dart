import 'package:flutter/material.dart';
import 'package:flutter_app/page/reversion/reversionBody/reversionBody.dart';
import 'package:flutter_app/page/reversion/reversionHeader/reversionHeader.dart';
import 'package:flutter_app/utils/httpList/reversion.dart';
import 'package:flutter_app/utils/screenUtil.dart';
class Reversion extends StatefulWidget {
  _ReversionState createState () => _ReversionState();
}

class _ReversionState extends State<Reversion> {
  // 数据列表
  List getData ;
  // 店铺信息
  var storeData ;
  /// 预约首页数据
  getReversionIndex(int type) async {
    var data = await ReversionHttpList().getReversionIndex(type);
    setState(() {
      this.getData = [];
      this.getData = data["data"]["projectList"];
      
      this.storeData = data["data"]["storeData"];
    });
    // print(this.getData);
  }
  @override
  void initState() {
    this.getReversionIndex(0);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    double settingWidth(int size) {
      return AdopScreenutil.getInstance().adaptationWidth(size, context);
    }

    double settingHeight(int size) {
      return AdopScreenutil.getInstance().adaptationHeight(size, context);
    }

    // double settingFontSize(int size) {
    //   return AdopScreenutil.getInstance().adaptationFontSize(size, context);
    // }
    return Scaffold(
      appBar: AppBar(
        title: Text("预约",style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: settingWidth(750),
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Container(
              width: settingWidth(710),
              margin: EdgeInsets.fromLTRB(settingWidth(20), settingHeight(20), 0, settingHeight(30)) ,
              decoration: BoxDecoration(
                // color: Colors.red,
              ),
              child: Column(
                children: <Widget>[
                  ReversionHeader(storeData: storeData ),
                  ReversionBody(getData: getData != null ? getData:[], callBack: (int type) => this.getReversionIndex(type))
                ],
              ),
            ),
          ) 
        ) 
      ) 
    );
  }
}