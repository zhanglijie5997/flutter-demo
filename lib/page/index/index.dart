
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/page/webview/webview.dart';
import 'package:flutter_app/utils/httpList/index.dart';
import 'package:flutter_app/utils/screenUtil.dart';
import 'package:flutter_app/page/index/indexBody/indexBody.dart';
import 'package:amap_location/amap_location.dart';
class Index extends StatefulWidget {
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  bool _show = false;
  var _indexData ;
  // banner数据
  List _bannerList; 
  // 数据
  List data = [];
  // 新品上架数据
  List _newProductList = []; 

  // 获取首页数据
  getIndexData() async {
    var data = await IndexHttp().getIndexData();
     print(data);
    setState(() {
      this._indexData = data["data"];
      this.data = data["data"]["excellentProject"];
      this._bannerList = data["data"]["bannerList"];
    });
    // print(this._bannerList);
  }

  // 获取新品上架数据
  getNewProduct() async {
    var data = await IndexHttp().getNewProduct();
    setState(() {
      this._newProductList = data["data"]["list"];
    });
  }
  // 获取用户地理位置
  getUserLocation() async{
//     AMapLocationClient.setApiKey("8d5b6b94037ec861f2b9bc9438b80082");

    await AMapLocationClient.startup(new AMapLocationOption(
      desiredAccuracy:CLLocationAccuracy.kCLLocationAccuracyHundredMeters  ));
    var location = await AMapLocationClient.getLocation(true);
    print("""
    经度：${location.longitude}
    纬度：${location.latitude}
    """);
     AMapLocationClient.onLocationUpate.listen((AMapLocation loc){
       if(!mounted)return;
       print(loc);
       setState(() {

       });
     });

  }
  @override
  void initState(){
    this.getIndexData();
    this.getNewProduct();
    this.getUserLocation();
    super.initState();
  }

  @override
  void dispose() {
//    AMapLocationClient.shutdown();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double radiusFn(int size) {
      return AdopScreenutil.getInstance().adaptationWidth(size, context);
    }

    double settingHeight(int size) {
      return AdopScreenutil.getInstance().adaptationHeight(size, context);
    }

    double settingFontSize(int size) {
      return AdopScreenutil.getInstance().adaptationFontSize(size, context);
    }
    

    // 头部左侧
    Widget headerLeft = Row(
      children: <Widget>[
        GestureDetector(
          child: Container(
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
                    this._indexData != null ? this._indexData["image"]: "https://desk-fd.zol-img.com.cn/t_s960x600c5/g5/M00/09/0E/ChMkJlxmkXiId-nFAAHjtDWSLkMAAu6WQCRyT8AAePM441.jpg",
                    // "https://desk-fd.zol-img.com.cn/t_s960x600c5/g5/M00/09/0E/ChMkJlxmkXiId-nFAAHjtDWSLkMAAu6WQCRyT8AAePM441.jpg",
                    fit: BoxFit.fitHeight),
              )),
          onTap: () {
//            print(123);
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                return WebView();
              }));
          },
        ),

        Container(
          margin: EdgeInsets.fromLTRB(radiusFn(20), radiusFn(80), 0, 0),
          width: radiusFn(270),
          child: Column(
            children: <Widget>[
              Container(
                width: radiusFn(270),
                child: Text(
                  this._indexData != null ? this._indexData["storeName"]: "",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(255, 241, 216, 1),
                      fontSize: AdopScreenutil.getInstance()
                          .adaptationFontSize(30, context)),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              
              Container(
                margin: EdgeInsets.only(top: radiusFn(20)),
                width: radiusFn(270),
                child: Text(this._indexData != null ? this._indexData["address"]:"",
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
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.circular(radiusFn(15))),
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
              child: Image.asset(
                "images/index/shouyejinsedingwe_9_12.9@2x.png",
                width: radiusFn(40),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: radiusFn(40)),
              child: Image.asset(
                "images/index/shouyejinsedianhuahao_9_12.9@2x.png",
                width: radiusFn(40),
              ),
            )
          ],
        ))
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

    // 吸底显示
    Widget toBottom = Container(
      width: radiusFn(750),
      height: settingHeight(1750),
      // color: Colors.red,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: settingHeight(0),
            child: Container(
              width: radiusFn(750),
              height: settingHeight(80),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [
                    Color.fromRGBO(255, 241, 218, 1),
                    Color.fromRGBO(255, 255, 210, 1),
                  ]
                )
              ),
              child: Container(
                width: radiusFn(690),
                margin: EdgeInsets.fromLTRB(radiusFn(30), 0, radiusFn(30), 0),
                child:  Flex(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Text(this._indexData != null ? this._indexData["storeName"] : "", style: TextStyle(fontSize: settingFontSize(30))),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(radiusFn(20)),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(radiusFn(50))
                            ),
                            margin: EdgeInsets.only(right: radiusFn(20)),
                            child: Image.asset("images/index/xiangqingdianhua_9_12.9@2x.png", width: radiusFn(30),),
                          ),
                          Container(
                            padding: EdgeInsets.all(radiusFn(20)),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(radiusFn(50))
                            ),
                            margin: EdgeInsets.only(right: radiusFn(20)),
                            child: Image.asset("images/index/xiangqingdingwei_9_12.9@2x.png", width: radiusFn(30),),
                          )
                        ],
                      ),
                    )
                  ],
                ) ,
              )
            ),
          )
        ],
      ),
    );
    return Scaffold(
        appBar: AppBar(
          title: Text("主页", style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white60,
        ),
        body: Stack(
          children: <Widget>[
            Container(
              child: Scrollbar(
                child: NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scroll) {
                    // 滚动到哪里执行吸底操作
                    double top =
                        scroll.metrics.pixels / scroll.metrics.maxScrollExtent;
                    if (top > 0.2) {
                      setState(() {
                        this._show = true;
                      });
                    } else {
                      setState(() {
                        this._show = false;
                      });
                    }
                    return false;
                  },
                  child: SingleChildScrollView(
                    //滚动方向，默认是垂直方向
                    scrollDirection: Axis.vertical,
                    //是否使用widget树中默认的PrimaryScrollController
                    primary: true,
                    physics: BouncingScrollPhysics(),
                    child: new Column(
                      children: <Widget>[
                        header,
                        _bannerList !=null ? IndexBody(data: data, list: _newProductList, bannerList: this._bannerList != null ? this._bannerList:[]):Text(""),
                    ],
                  ),
                ),
              )),
            ),
            this._show ? toBottom : Text("")

          ],
        ));
  }
}
