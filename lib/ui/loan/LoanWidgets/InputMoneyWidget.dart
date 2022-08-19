import 'package:flutter/material.dart';
import 'package:mc_dart/constants/assets.dart';

class InputMoneyWidget extends StatelessWidget {
  late String _money;

  InputMoneyWidget(String money) {
    this._money = money;
  }

  @override
  Widget build(BuildContext context) {
    return _buildInputMoney();
  }

  Widget _buildInputMoney() {
    var icon = Container(
      margin: EdgeInsets.only(right: 10),
      child: Image.asset(
        Assets.icVnd,
        width: 24,
        height: 24,
      ),
    );
    var iconBtn = Container(
      margin: EdgeInsets.only(left: 10, right: 6, top: 7, bottom: 7),
      alignment: Alignment.centerLeft,
      child: Image.asset(
        Assets.icBtnOther,
        width: 24,
        height: 24,
      ),
    );
    var textBtn = Container(
        alignment: Alignment.centerLeft,
        child: Text(
          "Nhập số khác",
          style: TextStyle(color: Color(0xFF1BC5AC), fontSize: 13),
          maxLines: 1,
        ));
    var text = this._money;
    var titleMoney = Text(
      text,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );

    var button = Container(
      padding: EdgeInsets.only(right: 9),
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
          color: Color(0xFFF0FCFA),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Color(0xFF1BC5AC))),
      child: Row(children: [iconBtn, textBtn]),
    );

    return Container(
        child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [icon, Expanded(child: titleMoney), button],
    ));
  }
}
