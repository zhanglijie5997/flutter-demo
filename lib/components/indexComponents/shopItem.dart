import 'package:flutter/material.dart';
import 'package:flutter_app/utils/screenUtil.dart';
class ShopItem extends StatefulWidget {
  ShopItem({Key key, this.item}): super(key: key);
  final item;
  _ShopItemState createState ()=> _ShopItemState();
}

class _ShopItemState extends State<ShopItem> {
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
      width: settingWidth(130),
      height: settingHeight(130),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(settingWidth(10))
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: settingWidth(350),
            height: settingWidth(350),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(settingWidth(10))),
              clipBehavior: Clip.antiAlias,
              child: Stack(
                children: <Widget>[
                  Image.network(widget.item["image"], height: settingWidth(350),fit: BoxFit.fitHeight, ),
                  Positioned(
                    top: settingHeight(233),
                    child: Container(
                      color: Color.fromRGBO(239, 112, 137, 1),
                      width: settingWidth(350),
                      height: settingHeight(45),
                      child: Center(
                        child: Text("首单体验价¥"+  widget.item['price'].toString() + " 元", 
                                style: TextStyle(fontSize: settingFontSize(26),
                                color: Colors.white,
                                ), 
                                textAlign: TextAlign.center),
                        ) 
                      ),
                    ),
                  ],
                ),
            ),
          ),
          Container(
            width: settingWidth(350),
            margin: EdgeInsets.only(left:settingWidth(20)),
            child:Text(widget.item["name"], style: TextStyle(color: Color.fromRGBO(153, 153, 153, 1)),) ,
          ),  
          Container(
            width: settingWidth(310),
            margin: EdgeInsets.only(left: settingWidth(0)),
            child: Flex(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              direction: Axis.horizontal,
              children: <Widget>[
                // 真实价格
                Text("¥" +  widget.item["currentPrice"].toString(), style: TextStyle(color: Color.fromRGBO(232, 24, 68, 1), fontSize: settingFontSize(26)),),
                // 已售
                Text("已售" + widget.item["sold"].toString(), style: TextStyle(color:Color.fromRGBO(153, 153, 153, 1), fontSize: settingFontSize(26)),)
              ],
            ),
          )        
        ],
      ) 
    );
  }
}