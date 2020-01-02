import 'package:flutter/material.dart';
import 'package:flutter_app/components/reversionComponents/reversionItem.dart';
import 'package:flutter_app/page/seach/seach.dart';
import 'package:flutter_app/utils/screenUtil.dart';

class ReversionBody extends StatefulWidget {
  _ReversionBodyState createState() => _ReversionBodyState();
}

class _ReversionBodyState extends State<ReversionBody> {
  List<String> firstTabList = ["未购买项目", "已购买项目"];
  int _firstActive = 0;
  List _reversionList = [
    {"image": "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1282530439,643532505&fm=26&gp=0.jpg"},
    {"image": "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1282530439,643532505&fm=26&gp=0.jpg"},
    {"image": "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1282530439,643532505&fm=26&gp=0.jpg"},
    {"image": "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1282530439,643532505&fm=26&gp=0.jpg"},
    {"image": "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1282530439,643532505&fm=26&gp=0.jpg"},
    {"image": "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1282530439,643532505&fm=26&gp=0.jpg"},
    {"image": "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1282530439,643532505&fm=26&gp=0.jpg"},
    {"image": "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1282530439,643532505&fm=26&gp=0.jpg"},
    {"image": "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1282530439,643532505&fm=26&gp=0.jpg"},

  ];
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
    // 搜索框
    Widget seach = GestureDetector(
      child: Container(
        height: settingHeight(65),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(settingWidth(50)),
          color: Color.fromRGBO(243, 243, 243, .7)
        ),
        width: settingWidth(690),
        margin: EdgeInsets.fromLTRB(settingWidth(20), settingHeight(20),
            settingWidth(20), settingHeight(20)),
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: settingWidth(30)),
              child: Text("请输入你想要的产品", style: TextStyle(fontSize: settingWidth(30)),),
            ),
            Container(
              margin: EdgeInsets.only(right: settingWidth(30)),
              child: Image.asset("images/index/sousuo_9_12.9@2x.png", width: settingWidth(40),),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          // new PageRouteBuilder(
          //               pageBuilder:(BuildContext context, Animation<double> animation,Animation<double> secondaryAnimation) {
          //   return  Seach();
          // },
          // transitionDuration: Duration(milliseconds: 2),
          
          // );
          MaterialPageRoute(builder: (BuildContext context) {
            return Seach();
          },)
        );
      },
    );
    
    // 一级tab切换
    Widget firstTab() {
      List<Widget> tabList = [];
      for (int i = 0; i < this.firstTabList.length; i++) {
          tabList.add(
            GestureDetector(
              child: Text(firstTabList[i], style: TextStyle(
                            fontSize: settingFontSize(30),
                            color: this._firstActive == i ? Color.fromRGBO(234, 24, 68, 1): Colors.black),
                            
                          ),
              onTap: () {
                setState(() {
                  this._firstActive = i;
                });
              },
            )
          );
      }
      return Container(
        width: settingWidth(630),
        margin: EdgeInsets.fromLTRB(settingWidth(20), 0, settingWidth(20), settingHeight(20)),
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: tabList,
        ),
      );
    }
    
    // 预约商品列表
    Widget reversionList() {
      return Container(
        child: ListView.builder(
          // 设置physics属性总是可滚动
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: this._reversionList.length,
          itemBuilder: (BuildContext context,int i) {
            return ReversionItem(data: this._reversionList[i]);
          },
        ),
      );
    }
    return Container(
      margin: EdgeInsets.only(top: settingHeight(20)),
      width: settingWidth(710),
      decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(settingWidth(20)),
                    color: Colors.white
                  ),
      child: Column(
        children: <Widget>[
          seach,
          firstTab(),
          reversionList(),
        ],
      ),
    );
  }
}
