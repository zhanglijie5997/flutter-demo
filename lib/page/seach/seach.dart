import 'package:flutter/material.dart';
import 'package:flutter_app/page/seach/seachBody/seachBody.dart';
import 'package:flutter_app/utils/screenUtil.dart';

class Seach extends StatefulWidget {
  _SeachState createState ()=> _SeachState();
}

class _SeachState extends State<Seach> {
  String _text = "";
  TextEditingController _textEditingController;
  List<String> list = ["需求1","需求2"];
  List<String> historyList = ["111", "222"];
  @override
  void initState() {
    _textEditingController = new TextEditingController(text: _text);
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
                      suffixIcon: Icon(Icons.close, color: Colors.black,),
                    ),
                  
                    // 设置输入框的输入类型的
                    keyboardType: TextInputType.text,
                    // 用于密码输入框
                    obscureText: false,
                    // 用户输入改变
                    onChanged: (String context) {
                      setState(() {
                        this._text = context;
                      });
                    },
                    onSubmitted: (String str) {
                      print(this._text);
                    },
                ),
              ) 
          ),
          
          // Text("data")
        ],
      ),
    );
    
    return Scaffold(
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
      body: SingleChildScrollView(
        // ios 回弹效果
        physics: BouncingScrollPhysics(),
        primary: true,
        child: Container(
          child: Column(
            children: <Widget>[
              seach,
              SeachBody(data: this.list, historyList: this.historyList,)
            ],
          ),
        ),
      ) 
    );
  }
}