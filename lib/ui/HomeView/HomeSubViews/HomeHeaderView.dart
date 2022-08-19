import 'package:another_flushbar/flushbar_helper.dart';
import 'package:mc_dart/utils/locale/app_localization.dart';
import 'package:mc_dart/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:mc_dart/constants/assets.dart';

class HomeHeaderView extends StatefulWidget {
  @override
  _HomeHeaderState createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeaderView> {
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
    return Container(
        margin: const EdgeInsets.only(top: 8),
        width: double.infinity,
        child: Column(
          children: [
            Row(
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.only(left: padding),
                    alignment: Alignment.centerLeft,
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      image:const DecorationImage(
                        image: AssetImage(
                            Assets.homeSubViewAuthBg),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    )
                ),
                Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 8, right: 8, top: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const <Widget>[
                            Text(
                              "mc_dart demo Flutter",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.bold),
                              maxLines: 1,
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(width: 10, height: 2),
                            Text(
                              "0999999999",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 14.0, color: Colors.black),
                              maxLines: 1,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        )
                    )
                ),
                Container(
                  height: 32,
                  width: 125,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          Assets.homeSubViewHeaderNextBg),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(left: 11, right: 0),
                    child: Row(
                      children: [
                        Text(
                          "Chưa xác thực",
                          overflow: TextOverflow.clip,
                          style: TextStyle(fontSize: 12.0, color: Colors.black),
                          maxLines: 1,
                          textAlign: TextAlign.center,
                        ),
                        Container(
                            height: 16,
                            width: 16,
                            margin: const EdgeInsets.only(right: padding, left: 0, top: 0),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(Assets.homeSubViewHeaderNextIcon),
                                fit: BoxFit.contain,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            Container(
                alignment: Alignment.bottomCenter,
                height: 1,
                width: double.infinity,
                color: Colors.black12,
            )
          ],
        )
    );
  }
}
