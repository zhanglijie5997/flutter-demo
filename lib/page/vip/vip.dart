
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/utils/httpList/vip.dart';
import 'package:flutter_app/utils/screenUtil.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:fluwx/fluwx.dart' as fluwx;
class Vip extends StatefulWidget {
  _VipState createState () => _VipState();
}

class _VipState extends State<Vip> {
  Map<String, dynamic> _userMsg;
  Future scan() async{
    try {
      // 此处为扫码结果，barcode为二维码的内容
      String barcode = await BarcodeScanner.scan();
      print('扫码结果: '+barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        // 未授予APP相机权限
        print('未授予APP相机权限');
      } else {
        // 扫码错误
        print('扫码错误: $e');
      }
    } on FormatException{
      // 进入扫码页面后未扫码就返回
      print('进入扫码页面后未扫码就返回');
    } catch (e) {
      // 扫码错误
      print('扫码错误: $e');
    }
  }

  void wxLogin() async{
    await fluwx.registerWxApi(
      appId: "wxd930ea5d5a258f4f",
      doOnAndroid: true,
      doOnIOS: true,
    );
    var result = await fluwx.isWeChatInstalled();
    print("is installed $result");
  }

   _getUser() async {
    var data = await VipHttp().getUser();

    setState(() {
      this._userMsg = data["data"];
      if(data["data"]["leave"] == 1) {
        this._userMsg["leave"] = "下忍";
      }
    });
    print(this._userMsg);
  }
  @override
  void initState() {
    // TODO: implement initState
    this._getUser();
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


    // 头部
    Widget header = Container(
      height: settingWidth(200),
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Container(
            width: settingWidth(200),
            height: settingWidth(200),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.network(this._userMsg !=null ? this._userMsg["avatar"]: "",fit: BoxFit.cover),
            )
          ),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(settingWidth(20), settingWidth(40), 0, settingWidth(20)),
                  child: Text(this._userMsg != null ? this._userMsg["name"] : "", style: TextStyle(
                      fontSize: settingFontSize(40),
                      fontWeight: FontWeight.w800,
                      color: Colors.redAccent
                  ))
                ),
                Container(
                  child:  Text(this._userMsg != null ? this._userMsg["leave"].toString(): "", style: TextStyle(
                    color: Colors.greenAccent,
                    fontSize: settingFontSize(26),
                    fontWeight: FontWeight.w600
                  ),)
                )

              ],
            ),
          )


        ],
      ),
  );
    return Scaffold(
//      appBar: AppBar(
////        title: Text("会员",style: TextStyle(color: Colors.black)),
////        backgroundColor: Colors.white,
//        flexibleSpace: Container(
//          height: settingHeight(200),
////          padding: EdgeInsets.only(top: settingHeight(200)) ,
//          child: Image.network("https://desk-fd.zol-img.com.cn/t_s960x600c5/g5/M00/02/02/ChMkJlbKxdKIVlddAAKi2pCQDEoAALHbwE9sFQAAqLy249.jpg",
//            fit: BoxFit.fitWidth,
//          ),
//        ),
//      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: settingWidth(750),
                  // height: settingHeight(200),
                  child: Image.network("https://desk-fd.zol-img.com.cn/t_s960x600c5/g5/M00/02/02/ChMkJlbKxdKIVlddAAKi2pCQDEoAALHbwE9sFQAAqLy249.jpg",
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Positioned(
                  top: settingHeight(100),
                  left: settingWidth(40),
                  child: Container(
                    child: header,
                  ),
                )
              ],
            ),
            // 签到等列表
            Container(
              child: ,
            )

          ],
        ),
      )
    );
  }
}