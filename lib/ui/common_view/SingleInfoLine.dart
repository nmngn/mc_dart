import 'package:flutter/material.dart';
import 'package:mc_dart/constants/assets.dart';

class SingleInfoLineCell extends StatefulWidget {
  late String _leadingText;
  late String _trailingText;
  late FontWeight _fontWeight;
  late Color _colorTrailing;
  late Color _colorLeading;

  SingleInfoLineCell(String leadingText, String trailingText,
      {colorTrailing = Colors.black,
      colorLeading = Colors.black,
      fontWeight = FontWeight.normal}) {
    _leadingText = leadingText;
    _colorLeading = colorLeading;
    _trailingText = trailingText;
    _colorTrailing = colorTrailing;
    _fontWeight = fontWeight;
  }

  @override
  SILCell createState() => SILCell();
}

class SILCell extends State<SingleInfoLineCell> {
  @override
  Widget build(BuildContext context) {
    return _lineInfo(widget._leadingText, widget._trailingText,
        colorTrailing: widget._colorTrailing,
        colorLeading: widget._colorLeading,
        fontWeight: widget._fontWeight);
  }

  Widget _lineInfo(String leadingText, String trailingText,
      {colorTrailing = Colors.black,
      colorLeading = Colors.black,
      fontWeight = FontWeight.normal}) {
    return Container(
      height: 24,
      width: double.infinity,
      child: ListTile(
        leading: Text(
          leadingText,
          style: TextStyle(fontSize: 15, color: colorLeading),
        ),
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            trailingText,
            style: TextStyle(
              color: colorTrailing,
              fontSize: 15,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}
