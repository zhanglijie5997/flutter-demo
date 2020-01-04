import 'package:flutter/material.dart';
import 'package:flutter_app/components/public/base.dart';
import 'package:flutter_app/utils/screenUtil.dart';
class ReversionDetailHeader extends StatefulWidget {
  _ReversionDetailHeaderState createState () => _ReversionDetailHeaderState();
}

class _ReversionDetailHeaderState extends State<ReversionDetailHeader> {
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
    /// 文字widget
    /// name 设置名称
    /// 设置信息
    Widget textWidget(String name ,String str, bool show) {
      return Container(
              width: settingWidth(630),
              margin: EdgeInsets.only(top: settingHeight(20)),
              padding: EdgeInsets.only(bottom: settingHeight(20)),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: show ? Color.fromRGBO(243, 243, 243, 1) : Color.fromRGBO(243, 243, 243, 0)
                  )
                )
              ),
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    
                    child: Text(name, style: TextStyle(fontSize: settingFontSize(30))),
                  ),
                  Container(
                    child: Text(str, style: TextStyle(fontSize: settingFontSize(30), 
                                color: Color.fromRGBO(232, 24, 68, 1)))
                  )
                ],
              ),
            );
    }

    return Container(
      width: settingWidth(690),
      clipBehavior: Clip.antiAlias,
      // height: settingHeight(500),
      margin: EdgeInsets.fromLTRB(settingWidth(0),settingHeight(20), 0, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(settingWidth(20)),
        color: Colors.white,
        shape: BoxShape.rectangle
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(0, settingHeight(20), 0, settingHeight(0)),
        width: settingWidth(630),
        child: Column(
          children: <Widget>[
            // 图片
            ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(settingWidth(20)) ,
              child: Image.network(Base().get(), width: settingWidth(630)),
            ),
            textWidget("项目名称", "看动漫", true),
            textWidget("项目时长", "20min", true),
            textWidget("选择员工", "到店分配", false),
          ],
        ),
      ) 
    );
  }
}