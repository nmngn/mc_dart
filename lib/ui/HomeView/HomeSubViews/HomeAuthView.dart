import 'package:another_flushbar/flushbar_helper.dart';
import 'package:mc_dart/utils/locale/app_localization.dart';
import 'package:mc_dart/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:mc_dart/constants/assets.dart';

class HomeAuthView extends StatefulWidget {
  @override
  _HomeAuthViewState createState() => _HomeAuthViewState();
}

class _HomeAuthViewState extends State<HomeAuthView> {
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
    return _buildMainView();
  }

  Widget _buildMainView() {
    const double padding = 16.0;
    const double imgWidth = 74;
    const double imgContainerWidth = 100;
    double viewHeight = 190.0;
    const double buttonWidth = 160.0;
    const double buttonHeight = 40.0;
    final ButtonStyle buttonStyle =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 18), primary: Colors.white,
        onPrimary: Colors.black, shadowColor: Colors.white, elevation: 0, shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(buttonHeight/2),
      ),
    );

    return Container(
      color: Colors.white,
      width: double.infinity,
      height: viewHeight,
      padding: const EdgeInsets.only(left: padding, right: 0, top: padding),
      child: Stack(
        children: <Widget>[
          Container(
            height: viewHeight,
            width: double.infinity,
              margin: const EdgeInsets.only(left: 0, right: padding, top: 0),
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage(
                    Assets.homeSubViewAuthBg),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(10),
            )
          ),
          Container(
            alignment: Alignment.topRight,
            child: Container(
              width: imgContainerWidth,
              height: imgContainerWidth,
              margin: const EdgeInsets.only(left: 0, right: 12, top: padding),
                decoration:const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        Assets.homeSubViewAuthSearch),
                    fit: BoxFit.fill,
                  ),
                )
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(left: padding, right: 2*padding + imgWidth + 8, top: 1.5*padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text(
                    "Xác thực tài khoản",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.bold),
                    maxLines: 1,
                ),
                SizedBox(width: 10, height: 8),
                Text(
                  "Trải nghiệm vay cực nhanh với sản phẩm Project X ngay nhé!",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12.0, color: Colors.white),
                  maxLines: 2,
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.only(bottom: padding + 8, right: padding),
            child: Container(
              width: buttonWidth,
              height: buttonHeight,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(buttonHeight/2),
                  color: Colors.white
              ),
              child: ElevatedButton(
                style: buttonStyle,
                onPressed: () {},
                child: const Text(
                  "Bắt đầu ngay",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
                  maxLines: 2,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
