import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mc_dart/constants/assets.dart';

class HeaderWidget2 extends StatefulWidget {
  late String _title;
  late String _subTitle;

  HeaderWidget2(String title, String subTitle) {
    this._title = title;
    this._subTitle = subTitle;
  }

  @override
  _HeaderWidget2State createState() => _HeaderWidget2State();
}

class _HeaderWidget2State extends State<HeaderWidget2> {
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
      margin: EdgeInsets.only(top: 5),
      child: Column(
        children: [
          Text(
            widget._title,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          Text(
            widget._subTitle,
            style: TextStyle(fontSize: 11),
          ),
        ],
      ),
      alignment: Alignment.centerLeft,
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
                  Expanded(
                    child: GestureDetector(
                      child: leftArrow,
                      onTap: () {
                        print("tap back");
                        Navigator.of(context).pop();
                      },
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: centerItem,
                    flex: 2,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
