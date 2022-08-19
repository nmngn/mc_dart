import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mc_dart/constants/assets.dart';
import 'package:mc_dart/ui/common_view/lib/otp/otp_field.dart';
import 'package:mc_dart/ui/common_view/lib/otp/style.dart';
import 'package:flutter/services.dart';

class InputTextWidget extends StatefulWidget {
  late TextEditingController _controller;
  late String _title;
  late String _textHidden;
  late bool _isNotEmpty;

  InputTextWidget(
      String title, String textHidden, TextEditingController controller,
      {bool isNotEmpty = true}) {
    this._controller = controller;
    this._title = title;
    this._textHidden = textHidden;
    this._isNotEmpty = isNotEmpty;
  }

  @override
  _InputTextWidgetState createState() => _InputTextWidgetState();
}

final FocusNode _node = FocusNode();

class _InputTextWidgetState extends State<InputTextWidget> {
  int index = 0;
  bool isChange = false;

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
    return _buildInputText();
  }

  Widget _buildInputText() {
    var listText = <Widget>[];
    if (widget._controller.text.length > 0) {
      for (int i = 0; i < widget._controller.text.length; i++) {
        var text = widget._controller.text[i];
        listText.add(_buildViewText(text));
      }
    } else {
      for (int i = 0; i < widget._textHidden.length; i++) {
        var text = widget._textHidden[i];
        listText.add(_buildViewText(text));
      }
    }

    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            print("object");
          },
          child: Container(
            margin: EdgeInsets.only(top: 10),
            height: 52,
            padding: EdgeInsets.only(left: 18),
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF1BC5AC)),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Row(
              children: listText,
            ),
          ),
        ),
        _buildText(),
        Opacity(
            opacity: 0.0,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Container(
                alignment: Alignment.center,
                child: TextField(
                  focusNode: _node,
                  onChanged: (text) {
                    print('on change text: $text');
                    setState(() {
                      isChange = !isChange;
                    });
                    // if (widget.onChangedText != null) {
                    //   widget.onChangedText!();
                    // }
                  },
                  keyboardType: TextInputType.text,
                  controller: widget._controller,
                ),
              ),
            )),
      ],
    );
  }

  Widget _buildText() {
    var icon = widget._isNotEmpty
        ? Text(
            "(*)",
            style: TextStyle(color: Colors.red, fontSize: 11),
          )
        : Text("");
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.only(left: 13),
          padding: EdgeInsets.only(left: 5),
          alignment: Alignment.center,
          height: 17,
          decoration: BoxDecoration(color: Colors.white),
          child: Text(
            widget._title,
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.normal),
          ),
        ),
        Container(
            padding: EdgeInsets.only(left: 2, right: 4),
            alignment: Alignment.center,
            height: 17,
            decoration: BoxDecoration(color: Colors.white),
            child: icon),
      ],
    );
  }

  Widget _buildViewText(String text) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(fontSize: 15),
      ),
    );
  }
}
