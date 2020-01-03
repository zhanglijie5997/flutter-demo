import 'package:flutter/material.dart';
import 'package:flutter_app/utils/screenUtil.dart';
class ReversionDetailBody extends StatefulWidget{
    _ReversionBodyState createState () => _ReversionBodyState();
}

class _ReversionBodyState extends State<ReversionDetailBody> {
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
    /// 显示7天日期
    Widget show7Day() {
      List<Widget> child = [];
      for (int i = 0; i < 7; i++) {
        int resultI = i + 1;
        child.add(
          Container(
            margin: EdgeInsets.fromLTRB(0, settingHeight(20), i < 6 ? settingWidth(48): settingWidth(0), 0),
            // margin: EdgeInsets.only(right: ),
            width: settingWidth(48),
            height: settingWidth(48),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(48),
              color: Color.fromRGBO(246, 246, 246, 1)
            ),
            child:Center(
                child: Container(
                  width: settingWidth(36),
                  height: settingWidth(36),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(48),
                    color: Color.fromRGBO(194, 194, 194, 1),
                  ),
                  child: Center(
                        child:Text("$resultI"),
                      )
                ),
            ) 
          )
        );
      } 
      return Container(
        child: Row(
          children: child,
        ),
      );
    }
    return Container(
      width: settingWidth(690),
      margin: EdgeInsets.fromLTRB(settingWidth(20), settingHeight(20), settingWidth(0), 0),
      padding: EdgeInsets.only(bottom:settingHeight(20) ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(settingWidth(20)),
        color: Colors.white
      ),
      child: Container(
        width: settingWidth(630),
        margin: EdgeInsets.fromLTRB(settingWidth(30), settingHeight(20), settingWidth(10), settingHeight(20)),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Text("选择时间", style: TextStyle(fontSize: settingFontSize(30)),),
                ),
                Expanded(
                  child: Text("2020-1-20",textAlign: TextAlign.center,style: TextStyle(color: Color.fromRGBO(153, 153, 153, 1),fontSize: settingFontSize(30))),
                ),
                Expanded(
                  child: Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("更多", style: TextStyle(color: Color.fromRGBO(153, 153, 153, 1)),),
                      Icon(Icons.chevron_right, color:  Color.fromRGBO(153, 153, 153, 1),)
                    ],
                  ),
                ),
              ],
            ),
            show7Day()
          ],
        ),
      ) 
    );
  }
}