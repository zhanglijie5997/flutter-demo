import 'package:flutter/material.dart';
import 'package:flutter_app/page/index/index.dart';
import 'package:flutter_app/page/reversion/reversion.dart';
import 'package:flutter_app/page/shop/shop.dart';
import 'package:flutter_app/page/vip/vip.dart';
import 'package:flutter_app/utils/screenUtil.dart';

class Router extends StatefulWidget {
  _RouteState createState () => _RouteState();
}

class _RouteState extends State<Router> {
  List list ;
  int _index ;
  @override
  void initState() {
    
    _index = 0;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    list = [
      {
        "id": 0, 
        "name": "主页", 
        "icon": Image.asset("images/appBar/hongshouye_9_12.9@2x.png", 
                            width: AdopScreenutil.getInstance().adaptationFontSize(50, context),
                            height: AdopScreenutil.getInstance().adaptationFontSize(50, context)
                            ), 
        "defaultIcon":Image.asset("images/appBar/heigshouye_9_12.9@2x.png", 
                            width: AdopScreenutil.getInstance().adaptationFontSize(50, context), 
                            height: AdopScreenutil.getInstance().adaptationFontSize(50, context)
                            ),
        "page": Index() 
      },
      {
        "id": 1, 
        "name": "商品", 
        "icon": Image.asset("images/appBar/hongishangpin_9_12.9@2x.png", 
                            width: AdopScreenutil.getInstance().adaptationFontSize(50, context),
                            height: AdopScreenutil.getInstance().adaptationFontSize(50, context),
                            ),
        "defaultIcon": Image.asset("images/appBar/heishangpin_9_12.9@2x.png", 
                            width: AdopScreenutil.getInstance().adaptationFontSize(50, context),
                            height: AdopScreenutil.getInstance().adaptationFontSize(50, context),
                            ),
        "page": Shop() 
      },
      {
        "id": 2, 
        "name": "预约", 
        "icon": Image.asset("images/appBar/hongyuyue_9_12.9@2x.png", 
                            width: AdopScreenutil.getInstance().adaptationFontSize(50, context),
                            height: AdopScreenutil.getInstance().adaptationFontSize(50, context),
                            ), 
        "defaultIcon": Image.asset("images/appBar/heiyuyue_9_12.9@2x.png",
                            width: AdopScreenutil.getInstance().adaptationFontSize(50, context),
                            height: AdopScreenutil.getInstance().adaptationFontSize(50, context),
                            ),
        "page": Reversion() 
      },
      {
        "id": 3, 
        "name": "会员", 
        "icon": Image.asset("images/appBar/honghuiyuan_9_12.9@2x.png",
                            width: AdopScreenutil.getInstance().adaptationFontSize(50, context),
                            height: AdopScreenutil.getInstance().adaptationFontSize(50, context),
                            ), 
        "defaultIcon": Image.asset("images/appBar/heihuiyuan_9_12.9@2x.png",
                            width: AdopScreenutil.getInstance().adaptationFontSize(50, context),
                            height: AdopScreenutil.getInstance().adaptationFontSize(50, context),
                            ),
        "page": Vip() 
      }
    ];
    List<BottomNavigationBarItem> Function() navigationBar = () {
      List<BottomNavigationBarItem> navigationList = []; 
      for(var item in list) {
        navigationList.add(
          BottomNavigationBarItem(
            icon: item["defaultIcon"],
            activeIcon: item["icon"],
            title: Text(item["name"]),
          )
        );
      }
      return navigationList;
    };
    return  Scaffold (
     
      bottomNavigationBar:BottomNavigationBar(
        // type: BottomNavigationBarType.fixed,
        selectedItemColor: Color.fromRGBO( 232, 24, 68, 1),
        unselectedItemColor: Colors.black12,
        iconSize: 20.0,
        items: navigationBar(),
        currentIndex: _index,
        onTap: (int index) {
          print(index);
          setState(() {
            _index = index;
          });
          // Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
          //   return list[index]["page"];
          // }));
        },
      ),
      
      body: Container(
        decoration: new BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(10.0, 10.0),blurRadius: 50,  spreadRadius: 5.0) ]
        ),
        child: list[_index]["page"],
      ),
    ); 
  }
}