import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdopScreenutil {
  AdopScreenutil._();
  static AdopScreenutil _instance;

  static AdopScreenutil getInstance() {
    if(_instance == null) {
      _instance = AdopScreenutil._();
    }
    return _instance;
  }

  /// 屏幕适配函数
  /// 宽度
  adaptationWidth(int size, BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return ScreenUtil.getInstance().setWidth(size);
  }
  /// 高度
  adaptationHeight(int size, BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return ScreenUtil.getInstance().setHeight(size);
  }
  /// 适配字体
  /// size 字体大小
  adaptationFontSize(int size, BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return ScreenUtil(allowFontScaling: true).setSp(size);
  }
}

