import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mc_dart/constants/assets.dart';

class HeaderWidget extends StatefulWidget {
  late String _title;
  late bool _isShowRightButton;
  late String _titleButton;

  HeaderWidget(String title, bool isShowRightButton,
      {String titleButton = "Luu"}) {
    this._title = title;
    this._isShowRightButton = isShowRightButton;
    this._titleButton = titleButton;
  }

  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  @override
  void initState() {
    super.initState();
  }

  Widget _buildBody() {
    var centerItem = Container(
      child: Text(
        widget._title,
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
      alignment: Alignment.center,
    );

    var leftArrow = Container(
      margin: EdgeInsets.only(left: 16),
      width: 40,
      alignment: Alignment.centerLeft,
      child: Image.asset(
        Assets.icLeftButton,
        width: 16,
        height: 16,
      ),
    );

    return Container(
        decoration: BoxDecoration(color: Colors.white),
        height: 45,
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  GestureDetector(
                    child: leftArrow,
                    onTap: () {
                      print("tap back");
                      Navigator.of(context).pop();
                    },
                  ),
                  Expanded(
                    child: centerItem,
                    flex: 1,
                  ),
                  _buildRightButton()
                ],
              ),
              flex: 1,
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              height: 1,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                  ),
                  color: Color(0xFFC2C2C2)),
            )
          ],
        ));
  }

  Widget _buildRightButton() {
    var text = Text(
      widget._isShowRightButton ? widget._titleButton : "",
      style: TextStyle(color: Color(0xFF1BC5AC)),
    );

    return Container(
      width: 40,
      margin: EdgeInsets.only(right: 13),
      alignment: Alignment.centerRight,
      child: text,
    );
  }
}
