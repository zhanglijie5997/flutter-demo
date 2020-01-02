import 'package:flutter/material.dart';

class Shop extends StatefulWidget {
  _ShopState createState () => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("商品",style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
    );
  }
}