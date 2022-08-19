import 'package:flutter/material.dart';
import 'package:mc_dart/constants/assets.dart';
import 'package:mc_dart/ui/HomeView/HomeSubViews/HomeHeaderView.dart';
import 'package:mc_dart/ui/common_view/loan_type_widget.dart';

class BankItemScreen extends StatefulWidget {
  late String _bankName;
  late String _image;

  BankItemScreen(String bankName) {
    this._bankName = bankName;
  }

  @override
  _BankItemScreenState createState() => _BankItemScreenState();
}

class _BankItemScreenState extends State<BankItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    var icon = Container(
      margin: EdgeInsets.only(top: 10, bottom: 2, left: 32, right: 32),
      child: Image.asset(
        Assets.icLoan,
        width: 40,
        height: 34,
        alignment: Alignment.center,
      ),
    );

    var bankName = Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Text(
        widget._bankName,
        style: TextStyle(
          fontSize: 13,
        ),
        textAlign: TextAlign.center,
      ),
    );

    return Container(
      height: 76,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.red),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [icon, bankName],
      ),
    );
  }
}
