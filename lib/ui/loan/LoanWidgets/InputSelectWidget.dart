import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mc_dart/constants/assets.dart';
import 'package:mc_dart/ui/common_view/lib/otp/otp_field.dart';
import 'package:mc_dart/ui/common_view/lib/otp/style.dart';
import 'package:flutter/services.dart';
import 'package:mc_dart/ui/loan/LoanWidgets/BottomPopupSelect.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class InputSelectWidget extends StatefulWidget {
  late TextEditingController _controller;
  late String _title;
  late String _textHidden;
  late bool _isNotEmpty;

  InputSelectWidget(
      String title, String textHidden, TextEditingController controller,
      {bool isNotEmpty = true}) {
    this._controller = controller;
    this._title = title;
    this._textHidden = textHidden;
    this._isNotEmpty = isNotEmpty;
  }

  @override
  _InputSelectWidgetState createState() => _InputSelectWidgetState();
}

final FocusNode _node = FocusNode();

class _InputSelectWidgetState extends State<InputSelectWidget> {
  int index = 0;
  bool isChange = false;

  late List<String> listItem = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 5; i++) {
      listItem.add("Ha Noi");
    }
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

    var icon = Image.asset(
      Assets.icDownButton,
      width: 16,
      height: 16,
    );

    var rightButton = Container(
      alignment: Alignment.centerRight,
      child: icon,
      margin: EdgeInsets.only(right: 16, top: 28),
    );

    return GestureDetector(
      onTap: () => showBarModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        expand: true,
        barrierColor: Colors.black26,
        builder: (context) => BottomSelectWidget(
          "Tinh/ thanh pho",
          listItem,
          1,
          getIndexSelected: (id) {
            print("id: " + id.toString());
          },
        ),
        context: context,
      ),
      child: Stack(
        children: [
          Container(
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
          rightButton,
          _buildText(),
        ],
      ),
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
