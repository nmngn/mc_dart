import 'package:flutter/material.dart';
import 'package:mc_dart/constants/assets.dart';
import 'package:mc_dart/ui/common_view/HeaderWidget2.dart';
import 'package:mc_dart/ui/loan/LoanWidgets/PersonalItemWidget.dart';

class LoanInfomationScreen extends StatefulWidget {
  @override
  _LoanInfomationScreenState createState() => _LoanInfomationScreenState();
}

class _LoanInfomationScreenState extends State<LoanInfomationScreen> {
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
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      body: _buildMain(),
    );
  }

  Widget _buildMain() {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(children: [
          _buildAppBar(),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: _buildMainView(),
            ),
          )
        ]));
  }

  Widget _buildAppBar() {
    return SafeArea(
      child: HeaderWidget2("Tạo yêu cầu vay", "Bước 1/3: Thông tin khoản vay"),
    );
  }

  Widget _buildMainView() {
    return ListView.separated(
        itemBuilder: (context, position) {
          return _buildItem(position);
        },
        separatorBuilder: (context, position) {
          return Divider(
            color: Colors.transparent,
          );
        },
        itemCount: 1);
  }

  Widget _buildItem(int position) {
    switch (position) {
      case 0:
        return PersonalItemWidget();
      default:
        return Container();
    }
  }
}
