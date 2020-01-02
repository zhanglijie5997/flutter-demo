import 'package:flutter/material.dart';
import 'package:flutter_app/page/reversion/reversionBody/reversionBody.dart';
import 'package:flutter_app/page/reversion/reversionHeader/reversionHeader.dart';
import 'package:flutter_app/utils/screenUtil.dart';
class Reversion extends StatefulWidget {
  _ReversionState createState () => _ReversionState();
}

class _ReversionState extends State<Reversion> {
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
        title: Text("预约",style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: settingWidth(710),
          margin: EdgeInsets.fromLTRB(settingWidth(20), settingHeight(20), 0, settingHeight(30)) ,
          decoration: BoxDecoration(
            // color: Colors.red,
          ),
          child: Column(
            children: <Widget>[
              ReversionHeader(),
              ReversionBody()
            ],
          ),
        ),
      ) 
    );
  }
}