import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/page/moreDay/moreDay.dart';
import 'package:flutter_app/utils/screenUtil.dart';
class ReversionDetailBody extends StatefulWidget{
    _ReversionBodyState createState () => _ReversionBodyState();
}

class _ReversionBodyState extends State<ReversionDetailBody> {
  int _index = 0;
  List<String> _reversionTimeList = ["8:30", "9:30","10:30","11:30","12:30","13:30","14:30",];
  String _text = ""; // 输入框文本
  int _weekIndex = -1; // 选择预约时间段
  String _choicTime = ''; // 选择的时间
  @override
  void initState() {
    var currentTime = new DateTime.now();
    print(currentTime);
    print(DateTime.parse("2020-02-04 00:29"));
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
    /// 显示7天日期
    Widget show7Day() {
      List<Widget> child = []; // 日期数组
      List<String> weekList = ["周日", "周一", "周二", "周三", "周四", "周五", "周六"];
      List<Widget> weekChild = []; // 周数组
      for (int i = 0; i < 7; i++) {
        int resultI = i + 1;
        child.add(
          GestureDetector(
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0, settingHeight(20), i < 6 ? settingWidth(48): settingWidth(0), 0),
                  // margin: EdgeInsets.only(right: ),
                  width: settingWidth(48),
                  height: settingWidth(48),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(48),
                    color: this._index == i ? Color.fromRGBO(255, 241, 237, 1) : Color.fromRGBO(246, 246, 246, 1)
                  ),
                  child:Center(
                      child: Container(
                        width: settingWidth(36),
                        height: settingWidth(36),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(48),
                          color: this._index == i ? Color.fromRGBO(232, 24, 68, 1) : Color.fromRGBO(194, 194, 194, 1),
                        ),
                        child: Center(
                              child:Text("$resultI", style: TextStyle(color: Colors.white),),
                            )
                      ),
                  ) 
                ),
                Positioned(
                  top: settingHeight(39),
                  left: settingWidth(60),
                  child: Container(
                    width: settingWidth(20),
                    height: settingHeight(1),
                    color: Color.fromRGBO(236, 236, 236, 1),
                    // color: Colors.red,
                    child: Text(""),
                  ),
                )
              ],
            ),
            onTap: () {
              setState(() {
                this._index = i;
              });
            },
          )
        );
        weekChild.add(
          Container(
            margin: i < 6 ? EdgeInsets.fromLTRB(settingWidth(0), settingHeight(20), settingWidth(45), settingHeight(0)):EdgeInsets.fromLTRB(0, settingHeight(20), 0, 0),
            child: Text(weekList[i]),
          )          
        );
      } 
      return Container(
        width: settingWidth(630),
        padding:EdgeInsets.only(bottom: settingHeight(20)) ,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: settingWidth(1),
              color: Color.fromRGBO(236, 236, 236, 1)
            )
          )
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: child,
            ),
            Row(
              children: weekChild,
            )
          ],
        ),
      );
    }
    
    /// 预约时间列表
    Widget reversionList() {
      List<Widget> list = [];
      for (var i = 0; i < this._reversionTimeList.length; i++) {
        list.add(
          GestureDetector(
            child: Container(
              width: settingWidth(110),
              height: settingHeight(46),
              decoration: BoxDecoration(
                color: this._weekIndex == i ? Color.fromRGBO(232, 24, 68, 1) : Color.fromRGBO(0, 0, 0, 0),
                border: Border.all(
                  width: this._weekIndex == i ? 0 : settingWidth(1),
                  color: this._weekIndex == i ? Color.fromRGBO(232, 24, 68, 1) : Color.fromRGBO(194, 194, 194, 1)
                ),
                borderRadius: BorderRadius.circular(settingWidth(20)),
                // color: Color.fromRGBO(r, g, b, opacity)
                
              ),
              child: Center(
                child: Text(this._reversionTimeList[i], 
                            style: TextStyle(fontSize: settingFontSize(28),
                            color: this._weekIndex == i ? Colors.white:Colors.black),),
              ) ,
            ),
            onTap: () {
              setState(() {
                this._choicTime = this._reversionTimeList[i];
                this._weekIndex = i;
              });
            },
          )
        );
      }
      return Container(
        margin: EdgeInsets.only(top: settingHeight(15)),
        child: Wrap(
          spacing: 10,//主轴上子控件的间距
          runSpacing: 7, //交叉轴上子控件之间的间距
          direction: Axis.horizontal, // 横显示
          children: list,
        ),
      );
    }
    
    /// 留言
    Widget liveText = Container(
      margin: EdgeInsets.only(left: settingWidth(30)),
      // height: settin,
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: settingHeight(90),
            margin: EdgeInsets.only(right: 20),
            child: Text("留言:", style: TextStyle(fontSize: settingFontSize(27)),),
          ),
          Container(
            width: settingWidth(500),
            child: TextFormField(
              maxLines: 2,
              maxLength: 50,
              decoration: InputDecoration(
                border: InputBorder.none
              ),
              // textDirection: TextDecoration.none,
              keyboardType: TextInputType.text,
              onChanged: (String context) {
                print(context);
                setState(() {
                  this._text = context;
                });
              },
            ),
          )
        ],
      ) 
    );
    return Container(
      width: settingWidth(750),
      margin: EdgeInsets.only(top: settingHeight(20)),
      // margin: EdgeInsets.fromLTRB(settingWidth(00), settingHeight(20), settingWidth(0), 0),
      // padding: EdgeInsets.only(bottom:settingHeight(20) ),
      
      child: Column(
        children: <Widget>[
          Container(
            width: settingWidth(690),
            // color: Colors.white,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(settingWidth(20)),
              color: Colors.white
            ),
            margin: EdgeInsets.fromLTRB(settingWidth(0), settingHeight(00), settingWidth(0), settingHeight(20)),
            child: Container(
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
                                  GestureDetector(
                                    child: Text("更多", style: TextStyle(color: Color.fromRGBO(153, 153, 153, 1)),),
                                    onTap: () {
                                      print("跳转更多预约日期界面");
                                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                                        return MoreDay();
                                      }));
                                    },
                                  ),
                                  Icon(Icons.chevron_right, color:  Color.fromRGBO(153, 153, 153, 1),)
                                ],
                              ),
                            ),
                          ],
                      ),
                      show7Day(),
                      reversionList(),
                  ],
                ),
              ),
          ) ,
          Container(
            padding: EdgeInsets.only(bottom: settingHeight(20)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(settingWidth(20)),
              color: Colors.white
            ),
            child: liveText,
          ),
          Container(
            margin: EdgeInsets.only(top: settingHeight(30)),
            child: CupertinoButton(
              borderRadius: BorderRadius.circular(0),
              color: Color.fromRGBO(232, 24, 68, 1),
              child: Container(
                padding: EdgeInsets.only(bottom: settingWidth(10)),
                width: settingWidth(750),
                child: Text("提交", textAlign: TextAlign.center,),
              ) ,
              onPressed: () async{
                print(this._index);
                print(this._text);
                print(this._choicTime);
                if(this._weekIndex < 0) {
                  print("请选择时间段");
                }
              },
            )
          )
          
        ],
      ) 
    );
  }
}