import 'package:flutter/material.dart';
import 'package:mc_dart/constants/assets.dart';
import 'package:mc_dart/ui/HomeView/HomeSubViews/HomeHeaderView.dart';
import 'package:mc_dart/ui/common_view/AccountItemWidget.dart';
import 'package:mc_dart/ui/common_view/HeaderWidget.dart';
import 'package:mc_dart/ui/common_view/header_login_widget.dart';
import 'package:mc_dart/ui/common_view/loan_type_widget.dart';
import 'package:mc_dart/utils/routes/routes.dart';

class AccountBankScreen extends StatefulWidget {
  @override
  _AccountBankScreenState createState() => _AccountBankScreenState();
}

class _AccountBankScreenState extends State<AccountBankScreen> {
  var listBank = [
    {"name": "ACB", "isMain": true, "stk": "0123456789"},
    {"name": "Vietcombank", "isMain": false, "stk": "0123456789"},
    {"name": "Techcombank", "isMain": false, "stk": "0123456789"},
  ];

  List<BankCell> listCell = [
    BankDetailCell("ACB", "0123456789", isMain: true),
    BankDetailCell("Vietcombank", "0123456789"),
    BankDetailCell("Techcombank", "0123456789"),
    AddBankCell()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      child: Column(
        children: [
          SafeArea(child: _buildChildAppBar()),
          Container(
            height: MediaQuery.of(context).size.height - 80,
            child: _buildListView(),
          ),
        ],
      ),
    );
  }

  Widget _buildListView() {
    return ListView.separated(
        itemBuilder: (context, position) {
          return _buildItem(position);
        },
        separatorBuilder: (context, position) {
          return Divider(
            color: Colors.transparent,
          );
        },
        itemCount: listCell.length + 1);
  }

  Widget _buildItem(int position) {
    switch (position) {
      case 0:
        return _buildTextHeader();
      default:
        return listCell[position - 1].buildWidget(context);
    }
  }

  Widget _buildChildAppBar() {
    return HeaderWidget(
      'Tai khoan ngan hang',
      true,
      titleButton: "sua",
    );
  }

  Widget _buildTextHeader() {
    var text = Text(
      "Thông tin ngân hàng",
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
    );
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: 16),
      height: 20,
      child: text,
    );
  }
}

abstract class BankCell {
  Widget buildWidget(BuildContext context);
}

class AddBankCell extends BankCell {
  @override
  Widget buildWidget(BuildContext context) {
    return _buildMainCell(context);
  }

  Widget _buildMainCell(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("go to create bank");
        Navigator.of(context).pushNamed(Routes.listBank);
      },
      child: AccountItemWidget("them tai khoan", false),
    );
  }
}

class BankDetailCell extends BankCell {
  late String _name;
  late String _stk;
  late bool _isMain;

  BankDetailCell(String name, String stk, {bool isMain = false}) {
    this._name = name;
    this._stk = stk;
    this._isMain = isMain;
  }
  @override
  Widget buildWidget(BuildContext context) {
    return _buildMainCell();
  }

  Widget _buildMainCell() {
    const double padding = 16.0;
    return Container(
        width: double.infinity,
        height: 64,
        margin: const EdgeInsets.only(left: padding, right: padding, top: 0),
        decoration: BoxDecoration(
            border: Border.all(
                color: _isMain ? Color(0xFF1BC5AC) : Color(0xFFDEE3E7)),
            borderRadius: BorderRadius.circular(8),
            color: Colors.white),
        child: Row(
          children: <Widget>[
            Container(
                alignment: Alignment.centerLeft,
                height: 40,
                width: 40,
                margin: const EdgeInsets.only(left: padding, right: padding),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.homeSubViewAuthBg),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(10),
                )),
            Expanded(
                flex: 1,
                child: Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(top: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          this._name,
                          style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          this._stk,
                          style: TextStyle(
                              fontSize: 13.0, color: Color(0xFF5C616F)),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ))),
            Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(right: 19),
                child: _isMain
                    ? Text(
                        "Tai khoan chinh",
                        style: TextStyle(color: Color(0xFF1BC5AC)),
                      )
                    : Text("")),
          ],
        ));
  }
}
