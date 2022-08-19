import 'package:flutter/material.dart';
import 'package:mc_dart/constants/assets.dart';
import 'package:mc_dart/ui/account/AccountSubView/BankItemCell.dart';
import 'package:mc_dart/ui/common_view/HeaderWidget.dart';

class ListBankScreen extends StatefulWidget {
  @override
  _ListBankScreenState createState() => _ListBankScreenState();
}

class _ListBankScreenState extends State<ListBankScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          _buildAppBar(),
          Expanded(
            child: Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                child: _buildListView()),
          )
        ],
      ),
    );
  }

  Widget _buildListView() {
    var list = <Widget>[];
    // list.add(_buildSearch());
    // list.add(_buildTitle());
    for (int i = 0; i < 20; i++) {
      list.add(_buildItemBank("bank name "));
    }

    var grid = Container(
      child: GridView.extent(
        primary: false,
        shrinkWrap: true,
        maxCrossAxisExtent: 100,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: list,
      ),
    );

    var temp = ListView(
      primary: true,
      children: [_buildSearch(), _buildTitle(), grid],
    );
    return temp;
  }

  Widget _buildSearch() {
    var icon = Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(
        left: 12,
        right: 4,
      ),
      child: Image.asset(
        Assets.icSearch,
        width: 16,
        height: 16,
      ),
    );

    return Container(
      height: 33,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: const Color(0xFFF6F7F8)),
      child: Row(
        children: [icon],
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 25, bottom: 16),
      child: const Text(
        "Danh sách ngân hàng hỗ trợ",
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildAppBar() {
    return SafeArea(
      child: HeaderWidget("Chon ngan hang", false),
    );
  }

  Widget _buildItemBank(String name) {
    return Container(
      child: BankItemScreen(name),
    );
  }
}
