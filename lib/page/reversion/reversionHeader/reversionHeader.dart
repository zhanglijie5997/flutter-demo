import 'package:flutter/material.dart';
import 'package:flutter_app/utils/screenUtil.dart';

class ReversionHeader extends StatefulWidget {
  _ReversionHeaderState createState () => _ReversionHeaderState();
}

class _ReversionHeaderState extends State<ReversionHeader> {
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
      width: settingWidth(710),
      height: settingHeight(84),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(settingWidth(20))
      ),
      child: Container(
        width: settingWidth(670),
        margin: EdgeInsets.fromLTRB(settingWidth(30), 0, settingWidth(30), 0),
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("三只松鼠的小店", style: TextStyle(fontSize: settingFontSize(30)),),
            Row(
              children: <Widget>[
                Text("切换店铺", style: TextStyle(fontSize: settingFontSize(26), color: Color.fromRGBO(153, 153, 153, 1))),
                Icon(Icons.chevron_right, color: Color.fromRGBO(153, 153, 153, 1),)
              ],
            )
          ],
        ),
      ) 
    );
  }
}