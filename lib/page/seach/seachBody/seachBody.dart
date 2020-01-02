import 'package:flutter/material.dart';
import 'package:flutter_app/utils/screenUtil.dart';
class SeachBody extends StatefulWidget {
  SeachBody({Key key, this.data, this.historyList}): super(key: key);
  final List data;
  final List historyList;
  _SeachBodyState createState () => _SeachBodyState();
}

class _SeachBodyState extends State<SeachBody> {
  @override
  Widget build(BuildContext context) {
    AdopScreenutil adopScreenutil = AdopScreenutil.getInstance();
    double settingWidth(int size) {
      return adopScreenutil.adaptationWidth(size, context);
    }
    double settingHeight(int size) {
      return adopScreenutil.adaptationHeight(size, context);
    }
    double settingFontSize(int size) {
      return adopScreenutil.adaptationFontSize(size, context);
    }
    // 历史搜索单个组件
    Widget historyItem(String str, int index) => Container(
      margin: EdgeInsets.only(top: settingHeight(20)),
      child: Row(
        children: <Widget>[
          Text(str, style: TextStyle(fontSize: settingFontSize(25), color: Colors.grey)),
          Container(
            margin: EdgeInsets.only(left: settingWidth(50)),
            child: GestureDetector(
              child:Icon(Icons.close, size: settingFontSize(25), color: Colors.grey),
              onTap: () {
                print(widget.historyList[index]);
              },
            ) 
          )
          
        ],
      ),
    );

    // 历史搜索
    Widget historyListWidget() => Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Text("历史搜索", style: TextStyle(fontSize: settingFontSize(30), fontWeight: FontWeight.w500)),
            width: settingWidth(690),
          ),
          Container(
            margin: EdgeInsets.only(top: settingHeight(20)),
            // width: settingWidth(690),
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              primary: true,
              itemCount: widget.historyList.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return historyItem(widget.historyList[index], index);
              },
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  child: Text("清空历史记录"),
                ),
                Container(
                  // child: Icon(Icons.),
                )
              ],
            ),
          )
        ],
      ),
    );

    // 推荐搜索
    Widget recommend = Container(
      width: settingWidth(690),
      margin: EdgeInsets.only(left: settingWidth(30)),
      child: Column(
        children: <Widget>[
          GridView.builder(
            primary: true,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: widget.data.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: settingHeight(70),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(236, 236, 236, 1),
                    borderRadius: BorderRadius.circular(settingWidth(10))
                  ),
                  child: GestureDetector(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(settingWidth(20), settingHeight(13), 0, 0),
                      child: Text(widget.data[index], style: TextStyle(wordSpacing: settingWidth(10)),),
                    ),
                    onTap: () {
                      print(widget.data[index]);
                    },
                  ),
                ),
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 横坐标元素个数
              mainAxisSpacing: settingWidth(20), // 纵轴间距
              crossAxisSpacing: settingWidth(10), // 横坐标间距
              childAspectRatio: 5, // 子组件宽高比
            ),
          ),
          historyListWidget()
        ],
      ),
    );

   
    return Container(
      child: recommend,
    );
  }
}