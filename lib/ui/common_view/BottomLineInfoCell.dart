import 'package:flutter/material.dart';
import 'package:mc_dart/constants/assets.dart';

class BottomLineInfoCell extends StatefulWidget {
  late String _leadingText;
  late String _trailingText;
  late FontWeight _fontWeight;
  late bool _isLast = false;

  BottomLineInfoCell(String leadingText, String trailingText,
      {fontWeight = FontWeight.normal, isLast = false}) {
    _leadingText = leadingText;
    _trailingText = trailingText;
    _fontWeight = fontWeight;
    _isLast = isLast;
  }

  @override
  BLICell createState() => BLICell();
}

class BLICell extends State<BottomLineInfoCell> {
  @override
  Widget build(BuildContext context) {
    return _infoCell(widget._leadingText, widget._trailingText,
        fontWeight: widget._fontWeight, isLast: widget._isLast);
  }

  Widget _infoCell(String leadingText, String trailingText,
      {fontWeight = FontWeight.normal, isLast = false}) {
    var colorLine = const Color(0xffE8EBEE);
    if (isLast == true) {
      colorLine = Colors.transparent;
    }
    return Container(
      height: 48,
      margin: const EdgeInsets.only(left: 16, right: 16),
      decoration:
          BoxDecoration(border: Border(bottom: BorderSide(color: colorLine))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              leadingText,
              style: const TextStyle(fontSize: 15),
            ),
          ),
          Expanded(
            flex: 3,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                trailingText,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: fontWeight,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
