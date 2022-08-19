import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mc_dart/constants/assets.dart';

class AccountItemWidget extends StatefulWidget {
  late String _title;
  late String _icon;
  late bool _isButton;

  AccountItemWidget(String title, bool isButton) {
    this._title = title;
    this._isButton = isButton;
  }

  @override
  _AccountItemWidget createState() => _AccountItemWidget();
}

class _AccountItemWidget extends State<AccountItemWidget> {
  bool _valueSwitch = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    var icon = Container(
      width: 40,
      height: 40,
      child: Image.asset(Assets.icQuickLoan),
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: 12)
    );

    var rightButton = Container(
      width: 40,
      height: 40,
      child: widget._isButton ?
        Switch(
          value: _valueSwitch,
          onChanged: onChangeSwitch,
          activeColor: Colors.white,
          activeTrackColor: Color(0xFF1BC5AC),
        ) 
        : Image.asset(Assets.icRightButton, width: 16, height: 16) ,
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(right: 10),
    );

    var text = Container(
      margin: EdgeInsets.only(left: 10),
      child: Text( widget._title, 
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
      ),
      alignment: Alignment.centerLeft,
    );

    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFDEE3E7)),
            borderRadius: BorderRadius.circular(8),
            color: Colors.white),
      width: double.infinity,
      height: 64,
      child: Row(
        children: [
          icon,
          Expanded(child: text, flex: 1,),
          rightButton
        ],
      ),
    );
  }
 

  void onChangeSwitch(bool newValue) { 
    setState(() {
      this._valueSwitch = !this._valueSwitch;
    });
  }
}
