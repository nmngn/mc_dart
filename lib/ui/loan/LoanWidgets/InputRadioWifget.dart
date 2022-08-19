import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mc_dart/constants/assets.dart';
import 'package:mc_dart/ui/common_view/lib/otp/otp_field.dart';
import 'package:mc_dart/ui/common_view/lib/otp/style.dart';
import 'package:flutter/services.dart';

class InputRadioWidget extends StatefulWidget {
  late String _title;
  late bool _isNotEmpty;

  InputRadioWidget(String title, {bool isNotEmpty = true}) {
    this._title = title;
    this._isNotEmpty = isNotEmpty;
  }

  @override
  _InputRadioWidgetState createState() => _InputRadioWidgetState();
}

final FocusNode _node = FocusNode();

enum Gender { male, female }

class _InputRadioWidgetState extends State<InputRadioWidget> {
  int index = 0;
  bool isChange = false;
  late Gender? _character;

  @override
  void initState() {
    super.initState();
    _character = Gender.male;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return _buildInputRadio();
  }

  Widget _buildInputRadio() {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            print("object");
          },
          child: Container(
            width: MediaQuery.of(context).size.width - 32,
            margin: EdgeInsets.only(top: 10),
            height: 52,
            padding: EdgeInsets.only(left: 18),
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF1BC5AC)),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildItemRadio(Gender.male),
                SizedBox(
                  width: 30,
                ),
                _buildItemRadio(Gender.female)
              ],
            ),
          ),
        ),
        _buildText(),
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

  Widget _buildItemRadio(Gender data) {
    var title = data == Gender.male ? "Nam" : "Nữ";
    var itemText = Text(
      title,
      style: TextStyle(fontSize: 15),
    );
    var img = data == _character
        ? Image.asset(
            Assets.icRadioActive,
            width: 16,
            height: 16,
          )
        : Image.asset(
            Assets.icRadio,
            width: 16,
            height: 16,
          );
    var icon = Container(
      child: img,
      margin: EdgeInsets.only(right: 7),
    );
    return GestureDetector(
      onTap: () {
        setState(() {
          _character = data;
        });
      },
      child: Row(
        children: [icon, itemText],
      ),
    );
  }
}
