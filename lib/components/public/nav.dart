import 'package:flutter/material.dart';
import 'package:flutter_app/utils/screenUtil.dart';

class Nav extends StatefulWidget {
  Nav({Key key, this.name, this.type}): super(key: key);
  String name;
  int type;
  _NavState createState () => _NavState();
}

class _NavState extends State<Nav> {
  /// imgList[0] 精品图标
  /// imgList[1] 新品上架图标
  List imgList = [
    {"image": "images/index/shouyejingpin_9_12.9@2x.png", "name": "精品项目"}, 
    {"image":"images/index/shouyexinpinshangjia_9_12.9@2x.png", "name": "新品上架"}];
  String rightIcon = "https://static.ilaisa.com/static/images/ls_shop/shouyegengduo_10.22@3x.png";
  @override
  Widget build(BuildContext context) {
    double settingWidth (int size) {
      return AdopScreenutil.getInstance().adaptationWidth(size, context);
    }

    double settingHeight(int size) {
      return AdopScreenutil.getInstance().adaptationHeight(size, context);
    }

    // double settingFontSize(int size) {
    //   return AdopScreenutil.getInstance().adaptationFontSize(size, context);
    // }
    return Container(
      width: settingWidth(670),
      padding: EdgeInsets.fromLTRB(settingWidth(20), settingHeight(20), 0, settingHeight(20)),
      decoration: BoxDecoration(
        // color: Colors.red,
        border: BorderDirectional(
          bottom: widget.type == 1 ? BorderSide(width: settingWidth(1), color: Color.fromRGBO(243, 243, 243, 1)) : BorderSide.none
        ),
      ),
      child: Flex(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        direction: Axis.horizontal,
        children: <Widget>[
           Container(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: settingWidth(30)),
                  child: Image.asset(imgList[widget.type]["image"], width: settingWidth(30),),
                ),
                Text(imgList[widget.type]["name"])
              ],
            ),
          ),
          
          Container(
              // padding: EdgeInsets.only(right: settingWidth(20)),
              child: GestureDetector(
                child: widget.type == 1 ? Image.network(rightIcon, width: settingWidth(30),height: settingHeight(30),) : Text(""),
                onTap: () {
                  if(widget.type == 1) {
                    print(widget.name);
                  }
                },
              ) 
            ),
         
        ],
      ),
    );
  }
}