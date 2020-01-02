import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/screenUtil.dart';
import 'package:flutter_app/page/index/indexBody/indexBody.dart';
class Index extends StatefulWidget {
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    double radiusFn(int size) {
      return AdopScreenutil.getInstance().adaptationWidth(size, context);
    }

    // 数据
    List data = [
      {"image": "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1282530439,643532505&fm=26&gp=0.jpg"},
      {"image": "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1282530439,643532505&fm=26&gp=0.jpg"},
      {"image": "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1282530439,643532505&fm=26&gp=0.jpg"},
    ];

    // 头部左侧
    Widget headerLeft = Row(
      children: <Widget>[
        Container(
            width: AdopScreenutil.getInstance().adaptationWidth(150, context),
            height: AdopScreenutil.getInstance().adaptationWidth(150, context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              // border: Border.all(width: 2.0, color: Colors.red),
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      AdopScreenutil.getInstance()
                          .adaptationWidth(8, context))),
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                  "https://youlin168.oss-cn-shenzhen.aliyuncs.com/shop/0b96bdf76075e34b058e536a5eb78495f566e810.jpeg",
                  fit: BoxFit.fitWidth),
            )),
        Container(
          margin: EdgeInsets.fromLTRB(radiusFn(20), radiusFn(80), 0, 0),
          width: radiusFn(270),
          child: Column(
            children: <Widget>[
              Text(
                "乐乐乐乐乐乐乐乐乐",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 241, 216, 1),
                    fontSize: AdopScreenutil.getInstance()
                        .adaptationFontSize(30, context)),
                overflow: TextOverflow.ellipsis,
              ),
              Container(
                margin: EdgeInsets.only(top: radiusFn(20)),
                width: radiusFn(270),
                child: Text("三九花园",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Color.fromRGBO(255, 241, 216, 1))),
              )
            ],
          ),
        )
      ],
    );
    // 头部右侧
    Widget headerRight = Column(
      children: <Widget>[
        Container(
          child: CupertinoButton(
            child: Container(
              padding: EdgeInsets.all(radiusFn(5)),
              width: radiusFn(150),
              decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.white),borderRadius: BorderRadius.circular(radiusFn(15))),
              child: Text(
                "切换地址",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: AdopScreenutil.getInstance()
                        .adaptationFontSize(24, context),
                    color: Colors.white),
              ),
            ),
            onPressed: () {
              print("切换");
            },
          ),
        ),
        Container(
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: radiusFn(30)),
                child: Image.asset("images/index/shouyejinsedingwe_9_12.9@2x.png", width: radiusFn(40),),
              ),
              Container(
                margin: EdgeInsets.only(left: radiusFn(40)),
                child: Image.asset("images/index/shouyejinsedianhuahao_9_12.9@2x.png", width: radiusFn(40),),
              )
            ],
          ) 
        )
      ],
    );
    // 头部
    Widget header = Container(
      child: Container(
        margin: EdgeInsets.only(left: radiusFn(20)),
        width: radiusFn(650),
        child: Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: <Widget>[
            new Expanded(
              child: headerLeft,
              flex: 2,
            ),
            new Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(radiusFn(50), radiusFn(20), 0, 0),
                child: headerRight,
              ),
              flex: 1,
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(radiusFn(20))),
          image: DecorationImage(
              image: NetworkImage(
                  "https://youlin168.oss-cn-shenzhen.aliyuncs.com/to_appreciate/Other/1.4.4/H5huiyuanzhongxinbeijing_9_11.26@3x.png"),
              fit: BoxFit.cover)),
      width: AdopScreenutil.getInstance().adaptationWidth(710, context),
      height: AdopScreenutil.getInstance().adaptationHeight(226, context),
      margin: EdgeInsets.fromLTRB(
          radiusFn(20), radiusFn(20), radiusFn(20), radiusFn(20)),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("主页", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        //滚动方向，默认是垂直方向
        scrollDirection: Axis.vertical,
        //是否使用widget树中默认的PrimaryScrollController
        primary: true,
        physics: BouncingScrollPhysics(),
        child:  new Column(
          children: <Widget>[
            header,
            IndexBody(data: data)
          ],
        ),
      ) 
    );
  }
}
