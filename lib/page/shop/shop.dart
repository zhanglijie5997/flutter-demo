import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Shop extends StatefulWidget {
  _ShopState createState () => _ShopState();
}

class _ShopState extends State<Shop> {
  File _image;

  void _saveImage() async{
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("商品",style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          _image == null ? Text("选择图片"): Image.file(_image),
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              this._saveImage();
            },
          )
        ],
      ),
    );
  }
}