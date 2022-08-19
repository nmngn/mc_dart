import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mc_dart/constants/assets.dart';
import 'package:mc_dart/ui/common_view/lib/otp/otp_field.dart';
import 'package:mc_dart/ui/common_view/lib/otp/style.dart';
import 'package:flutter/services.dart';

class InputPasswordWidget extends StatefulWidget {
  late TextEditingController _controller;
  late String _title;
  VoidCallback? onChangedText = null;

  InputPasswordWidget(TextEditingController controller, String title,
      {VoidCallback? onChangedText = null}) {
    this._controller = controller;
    this._title = title;
    this.onChangedText = onChangedText;
  }

  @override
  _InputPasswordWidget createState() => _InputPasswordWidget();
}

final FocusNode _node = FocusNode();

class _InputPasswordWidget extends State<InputPasswordWidget> {
  int index = 0;
  bool isShowPass = false;

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
    return _buildInputPassword();
  }

  Widget _buildInputPassword() {
    var listDot = <Widget>[];
    var listNumber = <Widget>[];

    for (int i = 0; i < 6; i++) {
      listDot.add(
        _buildViewDot(index > i),
      );
    }

    for (int i = 0; i < widget._controller.text.length; i++) {
      var text = widget._controller.text[i];
      listNumber.add(_buildViewNumber(text));
    }
    var icon = Image.asset(
      isShowPass ? Assets.icShowPass : Assets.icHidePass,
      width: 24,
      height: 24,
    );

    var rightButton = Container(
      alignment: Alignment.centerRight,
      child: icon,
      margin: EdgeInsets.only(right: 16, top: 24),
    );

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
              children: isShowPass ? listNumber : listDot,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(_node);
            print("tap change state");
            setState(() {
              isShowPass = !isShowPass;
            });
          },
          child: rightButton,
        ),
        _buildText(),
        Opacity(
            opacity: 0.0,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 60),
              child: Container(
                alignment: Alignment.topRight,
                child: TextField(
                  focusNode: _node,
                  onChanged: (text) {
                    print('change pin password: $text');
                    setState(() {
                      index = text.length > 0 ? text.length : 0;
                    });
                    if (widget.onChangedText != null) {
                      widget.onChangedText!();
                    }
                  },
                  maxLength: 6,
                  keyboardType: TextInputType.number,
                  controller: widget._controller,
                ),
              ),
            )),
      ],
    );
  }

  Widget _buildText() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.only(left: 13),
          padding: EdgeInsets.only(left: 5, right: 5),
          alignment: Alignment.center,
          height: 17,
          decoration: BoxDecoration(color: Colors.white),
          child: Text(
            widget._title,
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.normal),
          ),
        )
      ],
    );
  }

  Widget _buildViewDot(bool isActive) {
    return Container(
      width: 8,
      height: 8,
      margin: EdgeInsets.only(right: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: isActive ? Color(0xFF1BC5AC) : Color(0xFFA7AAB2)),
    );
  }

  Widget _buildViewNumber(String text) {
    return Container(
      width: 10,
      height: 40,
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }
}
