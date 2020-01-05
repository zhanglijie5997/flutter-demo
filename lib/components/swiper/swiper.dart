import 'package:flutter/material.dart';
import 'package:flutter_app/utils/screenUtil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperWidget extends StatefulWidget {
  SwiperWidget({Key key, this.bannerList}): super(key: key);
  final List bannerList;
  _SwiperWidgetState  createState () => _SwiperWidgetState();
} 
class _SwiperWidgetState extends State<SwiperWidget> {
  @override
  void initState() {
    print(widget.bannerList);
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
    return Container(
      child: Swiper(
        itemCount: widget.bannerList.length,
        autoplay: true,
        // duration: 3,
        // itemCount: 3,
        itemWidth: settingWidth(710),
        itemHeight: settingHeight(330),
        itemBuilder: (BuildContext context, int i) {
          return Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(settingWidth(10))
            ),
            child: Image.network(widget.bannerList[i]["image"], fit: BoxFit.cover)
          );
          // return Image.network("https://desk-fd.zol-img.com.cn/t_s960x600c5/g5/M00/09/0E/ChMkJ1xmjjmINCTAAAKkTfZiiEkAAu6VAKlLzAAAqRl846.jpg", fit: BoxFit.fitWidth,);
        },
        viewportFraction: 0.87,
        scale: 0.95,
        pagination: SwiperPagination(),
        // control: SwiperControl(),
      ),
    );
  }
}