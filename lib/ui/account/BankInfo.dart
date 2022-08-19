import 'package:flutter/material.dart';
import 'package:mc_dart/constants/assets.dart';
import 'package:mc_dart/ui/HomeView/HomeSubViews/HomeHeaderView.dart';
import 'package:mc_dart/ui/common_view/HeaderWidget.dart';
import 'package:mc_dart/ui/common_view/loan_type_widget.dart';

class BankInfoScreen extends StatefulWidget {
  @override
  _BankInfoScreenState createState() => _BankInfoScreenState();
}

class _BankInfoScreenState extends State<BankInfoScreen> {
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
          _buildAppBar(),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: _buildMainView(),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMainView() {
    return Container();
  }

  Widget _buildAppBar() {
    return SafeArea(
      child: HeaderWidget("Thông tin ngân hàng", false),
    );
  }
}
