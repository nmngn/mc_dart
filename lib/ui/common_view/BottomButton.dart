import 'package:flutter/material.dart';

class BottomButtonCell extends StatefulWidget {
  late String _text;
  late Color _color;
  late VoidCallback? _onTap = null;

  BottomButtonCell(String text, Color color, {VoidCallback? ontap}) {
    _text = text;
    _color = color;
    _onTap = ontap;
  }

  @override
  BBCell createState() => BBCell();
}

class BBCell extends State<BottomButtonCell> {
  @override
  Widget build(BuildContext context) {
    return bottom(widget._text, widget._color);
  }

  Widget bottom(String text, Color backgroundColor, {VoidCallback? onTap}) {
    return SafeArea(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 44,
          width: MediaQuery.of(context).size.width - 16 * 2,
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: backgroundColor,
          ),
          child: TextButton(
            onPressed: () {
              widget._onTap!();
            },
            child: Text(text,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}
