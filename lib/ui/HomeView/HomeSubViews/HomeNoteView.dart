import 'package:another_flushbar/flushbar_helper.dart';
import 'package:mc_dart/utils/locale/app_localization.dart';
import 'package:mc_dart/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:mc_dart/constants/assets.dart';

class HomeNoteView extends StatefulWidget {
  @override
  _HomeNoteState createState() => _HomeNoteState();
}

class _HomeNoteState extends State<HomeNoteView> {
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
    double viewHeight = 200.0 + 2 * padding;
    return Container(
        width: double.infinity,
        height: viewHeight,
        margin: const EdgeInsets.only(
            left: padding, right: padding, top: padding, bottom: padding),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(Assets.homeSubViewNoteBg),
          fit: BoxFit.fill,
        )),
        child: Column(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: padding, bottom: 8),
                child: Row(
                  children: <Widget>[
                    Spacer(flex: 1),
                    Container(
                        height: 20,
                        width: 20,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(Assets.homeSubViewNoteLight),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        )),
                    Text(
                      "Tip: Hoàn tất hồ sơ chỉ với 3 bước",
                      overflow: TextOverflow.clip,
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                    Spacer(flex: 1)
                  ],
                )),
            Container(
                height: 86,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(
                    top: padding, bottom: 0, left: padding, right: padding),
                child: Row(
                  children: <Widget>[
                    Container(
                        height: 86,
                        width: 90,
                        child: Column(children: <Widget>[
                          Container(
                              alignment: Alignment.center,
                              height: 48,
                              width: 48,
                              margin: const EdgeInsets.only(top: 0, bottom: 8),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(Assets.homeSubViewNote1),
                                  fit: BoxFit.fill,
                                ),
                              )),
                          Text(
                            "TOP ADDED askdfhkajsdhf akdjfhajksdhf asjkdfh",
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(fontSize: 12.0, color: Colors.black),
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        ])),
                    Expanded(child: Container(
                        alignment: Alignment.topCenter,
                        margin: const EdgeInsets.only(top: 0, bottom: 40),
                        height: 24,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(Assets.homeSubViewNoteArrow),
                            fit: BoxFit.contain,
                          ),
                        ))),
                    Container(
                        height: 86,
                        width: 90,
                        child: Column(children: <Widget>[
                          Container(
                              alignment: Alignment.center,
                              height: 48,
                              width: 48,
                              margin: const EdgeInsets.only(top: 0, bottom: 8),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(Assets.homeSubViewNote2),
                                  fit: BoxFit.fill,
                                ),
                              )),
                          Text(
                            "TOP ADDED askdfhkajsdhf akdjfhajksdhf asjkdfh",
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(fontSize: 12.0, color: Colors.black),
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        ])),
                    Expanded(child: Container(
                        height: 24,
                        margin: const EdgeInsets.only(top: 0, bottom: 40),
                        alignment: Alignment.topCenter,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(Assets.homeSubViewNoteArrow),
                            fit: BoxFit.contain,
                          ),
                        ))),
                    Container(
                        height: 86,
                        width: 90,
                        child: Column(children: <Widget>[
                          Container(
                              alignment: Alignment.center,
                              height: 48,
                              width: 48,
                              margin: const EdgeInsets.only(top: 0, bottom: 8),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(Assets.homeSubViewNote3),
                                  fit: BoxFit.fill,
                                ),
                              )),
                          Text(
                            "TOP ADDED askdfhkajsdhf akdjfhajksdhf asjkdfh",
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(fontSize: 12.0, color: Colors.black),
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        ]))
                  ],
                )),
            Expanded(child: Container()),
            Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 0, bottom: 30),
                child: Row(
                  children: <Widget>[
                    Spacer(flex: 1),
                    Text(
                      "Điều khoản",
                      overflow: TextOverflow.clip,
                      style: TextStyle(fontSize: 16.0, color: Colors.green, fontWeight: FontWeight.bold),
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                    Container(
                        height: 12,
                        width: 12,
                        margin: const EdgeInsets.only(right: 8, left: 8, top: 4),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(Assets.homeSubViewNoteNext),
                            fit: BoxFit.contain,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        )),
                    Spacer(flex: 1)
                  ],
                ))
          ],
        ));
  }
}
