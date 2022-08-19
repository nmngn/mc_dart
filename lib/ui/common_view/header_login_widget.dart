import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mc_dart/constants/assets.dart';

class HeaderLoginWidget extends StatefulWidget {
  late String _step;
  late bool _isForgot;

  HeaderLoginWidget(String step, bool isForgot) {
    this._step = step;
    this._isForgot = isForgot;
  }

  @override
  _HeaderLoginWidget createState() => _HeaderLoginWidget();
}

class _HeaderLoginWidget extends State<HeaderLoginWidget> {
  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    var centerItem = Container(
      child: Text(
        "Quen mat khau",
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: 15),
    );
    var rightItem = Container(
      height: 30,
      margin: EdgeInsets.only(right: 16),
      alignment: Alignment.centerRight,
      width: MediaQuery.of(context).size.width - 80,
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            gradient: const LinearGradient(
                colors: [
                  Color(0xFFAFFFF2),
                  Color.fromARGB(255, 13, 153, 223),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Text("Bước " + widget._step + "/3"),
          ),
          height: 28,
          width: 85,
          padding: EdgeInsets.only(left: 12, right: 12),
        ),
      ),
    );

    var leftArrow = Container(
      margin: EdgeInsets.only(left: 16),
      alignment: Alignment.centerLeft,
      child: Image.asset(
        Assets.icLeftButton,
        width: 16,
        height: 16,
      ),
    );

    return Container(
      height: 44,
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              child: leftArrow,
              onTap: () {
                print("tap back");
                Navigator.of(context).pop();
              },
            ),
            flex: 1,
          ),
          Expanded(
            child: widget._isForgot ? centerItem : rightItem,
            flex: widget._isForgot ? 2 : 5,
          )
        ],
      ),
    );
  }
}
