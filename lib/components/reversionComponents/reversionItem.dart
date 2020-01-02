import 'package:flutter/material.dart';
import 'package:flutter_app/utils/screenUtil.dart';

class ReversionItem extends StatefulWidget {
  ReversionItem({Key key, this.data}): super(key :key);
  final data;
  _ReversionItemState createState ()=> _ReversionItemState();
}

class _ReversionItemState extends State<ReversionItem> {
  @override
  void initState() {
    super.initState();
  }

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
      width: settingWidth(690),
      margin: EdgeInsets.only(left: settingWidth(30)) ,
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.network(widget.data["image"], width: settingWidth(180), height: settingHeight(180),),
          Expanded(
            child: Container(
                margin: EdgeInsets.only(left: settingWidth(20)),
                height: settingHeight(150),
                child:Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text("可预约项目", style: TextStyle(fontSize: settingFontSize(30)),textAlign: TextAlign.left,),
                    ), 
                    Container(
                      margin: EdgeInsets.fromLTRB(0, settingHeight(20), 0, 0),
                      alignment: Alignment.centerLeft,
                      child: Text("时长50min", style: TextStyle(fontSize: settingFontSize(26), color: Color.fromRGBO(232, 24, 68, 1)),textAlign: TextAlign.left),
                    ),
                    GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(top: settingHeight(20)),
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: settingWidth(140),
                          height: settingHeight(40),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Color.fromRGBO(232, 24, 68, 1)
                          ),
                          child: Center(
                            child: Text("预约", style: TextStyle(color: Colors.white),),
                          ),
                        ) ,
                      ),
                      onTap: () {
                        print("跳转预约");
                      },
                    )
                  ],
                )
            ),
          )
        ],
      ),
    );
  }
}