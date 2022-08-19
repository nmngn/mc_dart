import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:mc_dart/models/home/home_banner_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mc_dart/constants/assets.dart';

class HomeBannerView extends StatefulWidget {
  late List<BannerModel> _listBanner;

  HomeBannerView(List<BannerModel> list) {
    this._listBanner = list;
  }

  @override
  _HomeBannerState createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBannerView> {
  //stores:---------------------------------------------------------------------
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return _buildMainView(width);
  }

  Widget _buildMainView(double width) {
    var listImage = <Widget>[];
    for (var item in widget._listBanner) {
      var imageItem = Image.network(item.imageUrl);
      listImage.add(imageItem);
    }
    const double padding = 18.0;
    double viewHeight = 142.0 + padding * 2;
    double contentWidth = width - 2 * padding;
    Widget horizontalList1 = Container(
        color: Colors.white,
        padding: const EdgeInsets.only(
            top: padding, left: padding, right: padding, bottom: padding),
        height: viewHeight,
        child: ImageSlideshow(
          width: double.infinity,
          height: 200,
          children: listImage,
          autoPlayInterval: 3000,
          isLoop: true,
          onPageChanged: (value) {
            // print('Page changed: $value');
          },
          initialPage: 0,
        ));

    //ListView(scrollDirection: Axis.horizontal, children: listImage));
    return horizontalList1;
  }
}
