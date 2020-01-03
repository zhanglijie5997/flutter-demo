import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/indexComponents/shopItem.dart';
import 'package:flutter_app/components/public/nav.dart';
import 'package:flutter_app/utils/screenUtil.dart';

class IndexBody extends StatefulWidget {
  IndexBody({Key key,this.data}): super(key : key);
  final List data;
  _IndexBodyState createState () => _IndexBodyState();
}

class _IndexBodyState extends State<IndexBody> {
  @override
  void initState() {
    
    super.initState();
  }
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

    
    // 头部进入会员
    Widget header = Container(
      width: settingWidth(710),
      height: settingHeight(100),
      color: Color.fromARGB(0, 1, 1, 1),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(settingWidth(60))
        ),
        clipBehavior: Clip.antiAlias,
        child: Container(
          margin: EdgeInsets.only(top: settingHeight(5)),
          height: settingHeight(100),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://youlin168.oss-cn-shenzhen.aliyuncs.com/to_appreciate/Other/1.4.4/daanniu_9.11.11@3x.png"),
              fit: BoxFit.contain
            )
          ),
          child: Container(
            width: settingWidth(650),
            margin: EdgeInsets.fromLTRB(settingWidth(30), 0, settingWidth(30), 0),
            child: 
                  Flex(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    direction: Axis.horizontal,
                    children: <Widget>[
                      new Expanded(
                        flex: 4,
                        child: Container(
                          child: Text("会员享受最贵特权新体验", style: TextStyle(color: Color.fromRGBO(255, 241, 219, 1), fontSize: settingFontSize(35),fontWeight: FontWeight.w500)),
                        ),
                      ),
                      new Expanded(
                        flex: 1,
                        child: Container(
                          width: settingWidth(80),
                          height: settingHeight(40),
                          decoration: BoxDecoration(
                            // border: Border.all(width: settingWidth(1)),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.topRight,
                              colors: [
                                Color.fromRGBO(255, 241, 190, 1),
                                Color.fromRGBO(255, 241, 218, 1)
                              ]
                            ),
                            borderRadius: BorderRadius.circular(settingWidth(24))
                          ),
                          child: Center(
                            child: Text("立即进入",textAlign: TextAlign.center, style: TextStyle(color:Colors.black, fontSize: settingFontSize(24) ),),
                          ) 
                        ),
                      )
                      
                    ],
                  )
              ),
            )
           
        )
        
      );

    // 中间轮播图部分
    Widget body = Container(
      child: Stack(
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                settingWidth(10)
              )
            ),
            clipBehavior: Clip.antiAlias,
            child:Image.network("https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1282530439,643532505&fm=26&gp=0.jpg", 
                        width: settingWidth(710), height: settingHeight(330),fit: BoxFit.cover,),
          ),
          
          Positioned(
            top: settingHeight(20),
            left: settingWidth(40),
            width: settingWidth(630),
            height: settingHeight(60),
            
            child:  GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(243, 243, 243, .7),
                  borderRadius: BorderRadius.circular(settingWidth(30))
                ),
                child: Flex(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: settingWidth(20)),
                      child: Text("请输入你想要的产品", style: TextStyle(color: Color.fromRGBO(0, 0, 0, .5),fontSize: settingFontSize(30))),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: settingWidth(20)),
                      child: Image.asset("images/index/sousuo_9_12.9@2x.png", width: settingWidth(40),),
                    )
                  ],
                ) 
              ),
              onTap: () {
                print("跳转搜索页面");
              },
            ),
          )
        ],
      ),
    );
    
    // 下部商品列表部分
    Widget foots (String name, int type) =>  Container(
      width: settingWidth(710),
      margin: EdgeInsets.only(top: settingHeight(20)),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(settingWidth(20))
      ),
      child: Column(
        children: <Widget>[
          Nav(name: name, type: type),
         
          GridView.builder(
            itemCount: widget.data.length,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //横轴元素个数
              crossAxisCount: 2,
              // 纵轴间距
              mainAxisSpacing: settingHeight(20),
              // 横轴间距
              crossAxisSpacing: settingWidth(10),
              // 子组件宽高比
              childAspectRatio: 0.9
            ),
            itemBuilder: (BuildContext context, int index) {
              return ShopItem(item: widget.data[index]); 
              // return Text("123");
            },
          )
        ],
      ),
    );
    return Container(
      padding: EdgeInsets.only(bottom: settingHeight(30)),
      child: Column(
        children: <Widget>[
          header,
          body,
          foots("精品项目", 0),
          foots("新品上架", 1),

        ],
      ),
    );
  }
}