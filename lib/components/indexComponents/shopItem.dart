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
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(settingWidth(10))),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: <Widget>[
                Image.network(widget.item["image"], fit: BoxFit.cover,),
                Positioned(
                  top: settingHeight(233),
                  child: Container(
                    color: Color.fromRGBO(239, 112, 137, 1),
                    width: settingWidth(350),
                    height: settingHeight(45),
                    child: Center(
                      child: Text("首单体验价¥55元", 
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
          
          Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.horizontal,
            children: <Widget>[
              Text("¥44", style: TextStyle(color: Color.fromRGBO(232, 24, 68, 1), fontSize: settingFontSize(26)),),
              Text("已售0", style: TextStyle(color:Color.fromRGBO(153, 153, 153, 1), fontSize: settingFontSize(26)),)
            ],
          )
        ],
      ) 
    );
  }
}