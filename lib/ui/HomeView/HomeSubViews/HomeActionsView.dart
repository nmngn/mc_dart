import 'package:another_flushbar/flushbar_helper.dart';
import 'package:mc_dart/utils/locale/app_localization.dart';
import 'package:mc_dart/utils/routes/routes.dart';
import 'package:mc_dart/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:mc_dart/constants/assets.dart';

class HomeActionsView extends StatefulWidget {
  @override
  _HomeActionsState createState() => _HomeActionsState();
}

class _HomeActionsState extends State<HomeActionsView> {
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
    double viewHeight = 114.0 + padding;
    return Container(
      width: double.infinity,
      height: viewHeight,
      padding:
          const EdgeInsets.only(left: padding, right: padding, top: padding),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                print("continue to loan");
                Navigator.of(context).pushNamed(Routes.productLoan);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                        alignment: Alignment.center,
                        height: 31,
                        width: 31,
                        margin: const EdgeInsets.only(top: padding, bottom: 8),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(Assets.homeSubViewActionSaving),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        )),
                    Text(
                      "Vay tiền",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(width: 10, height: 4),
                    Text(
                      "Đa dạng mục đích",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14.0, color: Colors.black),
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: padding, height: viewHeight),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      height: 31,
                      width: 47,
                      margin: const EdgeInsets.only(top: padding, bottom: 8),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(Assets.homeSubViewActionWithDraw),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      )),
                  Text(
                    "Trả nợ",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(width: 10, height: 4),
                  Text(
                    "Thanh toán định kỳ",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14.0, color: Colors.black),
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
