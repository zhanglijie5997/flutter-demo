import 'package:flutter/material.dart';
import 'package:flutter_app/utils/base/base.dart';
import 'package:flutter_app/utils/screenUtil.dart';
class MoreDay extends StatefulWidget {
    _MoreDayState createState () => _MoreDayState();
}

class _MoreDayState extends State<MoreDay> {
  List<String> _weekList = ["周日", "周一", "周二", "周三", "周四", "周五", "周六"];
  @override
  Widget build(BuildContext context) {
    double settingWidth(int size) {
      return AdopScreenutil.getInstance().adaptationWidth(size, context);
    }

    double settingHeight(int size) {
      return AdopScreenutil.getInstance().adaptationHeight(size, context);
    }

    double settingFontSize(int size) {
      return AdopScreenutil.getInstance().adaptationFontSize(size, context);
    }
    /// 顶部周显示
    Widget weekWidget() {
      List<Widget> list = [];
      for (int i = 0; i < this._weekList.length; i++) {
        list.add(
          Container(
            margin: i < 6 ? EdgeInsets.only(right: settingWidth(46)) : EdgeInsets.only(right: settingWidth(0)),
            child: Text(this._weekList[i], style: TextStyle(fontSize: settingFontSize(24), color: Color.fromRGBO(153, 153, 153, 1)),),
          )
        );
      }
      return Container(
        padding: EdgeInsets.only(bottom: settingHeight(28)),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: settingWidth(1),
              color: Color.fromRGBO(153, 153, 153, 1)
            )
          )
        ),
        // width: settingWidth(630),
        margin: EdgeInsets.fromLTRB(settingWidth(35), settingHeight(30), settingWidth(30), settingHeight(30)),
        child: Row(
          children: list,
        ),
      );
    }
    
    /// 本月选择日期
    Widget currentMonth() {
      var time = Base.timeFormat("2020-01-04 11:46:20");
      print(time);
      return Container(
        child: Text("data"),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("更多", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        leading: GestureDetector(
          child: Icon(Icons.chevron_left, color: Colors.black, size: settingFontSize(50),),
          onTap: () {
            Navigator.of(context).pop();
          },
        ) ,
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(settingWidth(30), settingHeight(20), settingWidth(30), settingHeight(20)),
        width: settingWidth(690),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(settingWidth(20))
        ),
        child: Column(
          children: <Widget>[
            weekWidget(),
            currentMonth()
          ],
        ),
      ),
    );
  }
}