import 'package:another_flushbar/flushbar_helper.dart';
import 'package:mc_dart/constants/colors.dart';
import 'package:mc_dart/utils/locale/app_localization.dart';
import 'package:mc_dart/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:mc_dart/constants/assets.dart';

class HomeTitleView extends StatefulWidget {
  @override
  _HomeTitleState createState() => _HomeTitleState();
}

class _HomeTitleState extends State<HomeTitleView> {
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
    double viewHeight = 30.0 + padding;
    return Container(
      width: double.infinity,
      height: viewHeight,
      padding: const EdgeInsets.only(left: padding, right: padding, top: padding + 4),
      // decoration: BoxDecoration(
      //   border: Border.all(color: Colors.blueAccent),
      //   borderRadius: BorderRadius.circular(8),
      // ),
      child: Text(
        "Sản phẩm vay",
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 18.0, color: Colors.black,fontWeight: FontWeight.bold),
        maxLines: 1,
      )
    );

  }
}
