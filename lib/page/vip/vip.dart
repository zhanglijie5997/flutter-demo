import 'package:flutter/material.dart';
import 'package:flutter_app/utils/screenUtil.dart';
class Vip extends StatefulWidget {
  _VipState createState () => _VipState();
}

class _VipState extends State<Vip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("会员",style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Text("vip", style: TextStyle(fontSize:  AdopScreenutil.getInstance().adaptationFontSize(40, context))),
      ),
    );
  }
}