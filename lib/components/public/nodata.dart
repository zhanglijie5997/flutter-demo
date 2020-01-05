import 'package:flutter/material.dart';
import 'package:flutter_app/utils/screenUtil.dart';

class NoData extends StatelessWidget{
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
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: settingWidth(710),
            margin: EdgeInsets.only(left: settingWidth(0)),
            height: settingHeight(700),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(settingWidth(20)) 
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.network("http://dmimg.5054399.com/allimg/narutopic/160401a/001.jpg", fit: BoxFit.fitWidth,),
            ) 
          ),
          Text("没有数据哦～", style: TextStyle(fontSize: settingFontSize(30), color: Color.fromRGBO(153, 153, 153, 1) ),)
        ],
      ),
    );
  }
}