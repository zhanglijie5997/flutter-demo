import 'package:flutter/material.dart';
import 'package:flutter_app/components/indexComponents/shopItem.dart';
import 'package:flutter_app/components/public/nodata.dart';
import 'package:flutter_app/page/seach/seachBody/seachBody.dart';
import 'package:flutter_app/utils/httpList/seach.dart';
import 'package:flutter_app/utils/screenUtil.dart';

class Seach extends StatefulWidget {
  _SeachState createState ()=> _SeachState();
}

class _SeachState extends State<Seach> {
  String _text = "";
  List _seachList = [];
  TextEditingController _textEditingController;
  List<String> list = ["需求1","需求2"];
  List<String> historyList = ["111", "222","111", "222","111", "222","111", "222","111", "222","111", "222","111", "222","111", "222","111", "222","111", "222","111", "222","111", "222","111", "222", ];
  @override
  void initState() {
    _textEditingController = new TextEditingController(text: _text);
    this.getSeach();
    super.initState();
  }

  void getSeach() async {
     var data = await SeachHttpList().getSeach(this._text);
      
     setState(() {
       this._seachList = data["data"]["list"];
     });
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
    void change(String context) {
      setState(() {
        this._text = context;
        this._seachList = [];
      });
    }
    // 搜索
    Widget seach = Container(
      width: settingWidth(710),
      height: settingHeight(100),
      margin: EdgeInsets.only(left: settingWidth(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(settingWidth(30)),
                color: Color.fromRGBO(243, 243, 243, 1)
                // color: Colors.red
              ),
              margin: EdgeInsets.fromLTRB(settingWidth(20), settingHeight(20), 0, settingHeight(20)) ,
              width: settingWidth(690),
              height: settingHeight(100),
              
              child:Center(
                child: TextField(

                    style: TextStyle(fontSize: settingFontSize(40)),
                    // maxLength: 30,
                    controller: this._textEditingController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      // labelText: "请输入你想要的产品",
                      prefixIcon: Padding(
                        padding: EdgeInsetsDirectional.only(top: settingHeight(5)),
                        child: Image.asset("images/index/sousuo_9_12.9@2x.png", 
                                            width: settingWidth(10),
                                            height: settingHeight(10),
                                            scale: 1.5,
                                          ),
                      ) ,
                      labelStyle: TextStyle(
                        fontSize: settingFontSize(20),
                        color: Color.fromRGBO(243, 243, 243, .7)
                      ),
                      // // 设置输入时候的光标。
                      // hintText: "请输入您要搜索的产品",
                      // hintStyle: TextStyle(
                      //   fontSize: settingFontSize(30),
                      //   color: Colors.grey,
                        
                      // ),
                      suffixIcon: GestureDetector(
                        child:Icon(Icons.close, color: Colors.black,),
                        onTap:() {
                          this._textEditingController.clear();
                          change("");
                        } ,
                      ) 
                    ),
                  
                    // 设置输入框的输入类型的
                    keyboardType: TextInputType.text,
                    // 用于密码输入框
                    obscureText: false,
                    // 用户输入改变
                    onChanged: change,
                    
                    onSubmitted: (String str) {
                       
                      this.getSeach();
                    },
                ),
              ) 
          ),
          
          // Text("data")
        ],
      ),
    );
    
    // 搜索结果页
    Widget seachListWidget() {
      return Container(
        width: settingWidth(690),
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //横轴元素个数
              crossAxisCount: 2,
              // 纵轴间距
              mainAxisSpacing: settingHeight(20),
              // 横轴间距
              crossAxisSpacing: settingWidth(10),
              // 子组件宽高比
              childAspectRatio: 0.80
          ),
          shrinkWrap: true,
          itemCount: this._seachList.length,
          itemBuilder: (BuildContext context, int i) {
            return ShopItem(item: this._seachList[i]);
          },
        ),
      );
    }
    return  Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.chevron_left, color: Colors.black,size: settingWidth(50),),
          onTap: () {
            Navigator.of(context).pop();
          },
        ) ,
        title: Text("搜索", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: settingWidth(750),
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Container(
              width: settingWidth(710),
              margin: EdgeInsets.fromLTRB(settingWidth(0), settingHeight(20), 0, settingHeight(30)) ,
              decoration: BoxDecoration(
                // color: Colors.red,
              ),
              child: Column(
                children: <Widget>[
                  seach,
                  // seachListWidget()
                  this._text == "" ? SeachBody(data: this.list, historyList: this.historyList) : 
                                                      this._seachList.length > 0 ? seachListWidget() : NoData(),
                ],
              ),
            ),
          ) 
        ) 
      ) 
    );
  }
}