import 'package:flutter/material.dart';
import 'package:flutter_app/page/reversionDetail/reversionDetailBody/reversionDetailBody.dart';
import 'package:flutter_app/page/reversionDetail/reversionDetailHeader/reversionDetailHeader.dart';
import 'package:flutter_app/utils/screenUtil.dart';
class ReversionDetail extends StatefulWidget {
  _ReversionDetailState createState () => _ReversionDetailState();
}
class _ReversionDetailState extends State<ReversionDetail> {
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

    return Scaffold(
      appBar: AppBar(
        title: Text("预约详情", style: TextStyle(fontSize: settingFontSize(30), color: Colors.black),),
        backgroundColor: Colors.white,
        leading: GestureDetector(
          child: Icon(Icons.chevron_left, color: Colors.black,size: settingFontSize(50),),
          onTap: () {
            Navigator.of(context).pop();
          },
        ) 
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            ReversionDetailHeader(),
            ReversionDetailBody()
          ],
        ),
      ),
    );
  }
}