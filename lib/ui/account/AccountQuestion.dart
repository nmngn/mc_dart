import 'package:flutter/material.dart';
import 'package:mc_dart/constants/assets.dart';
import 'package:mc_dart/ui/common_view/HeaderWidget.dart';
import 'package:mc_dart/ui/common_view/lib/AccountQuestionCell.dart';
import 'package:mc_dart/utils/routes/routes.dart';

class AccountQuestionScreen extends StatefulWidget {
  @override
  _AccountQuestionScreenState createState() => _AccountQuestionScreenState();
}

class _AccountQuestionScreenState extends State<AccountQuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        SafeArea(
          bottom: false,
          child: _buildChildAppBar(),
        ),
        Expanded(child: _buildChildBody())
      ],
    );
  }

  Widget _buildChildAppBar() {
    return HeaderWidget('Câu hỏi thường gặp', false);
  }

  void changeScreen() {
    Navigator.of(context).pushNamed(Routes.accountAnswer);
  }

  Widget _buildChildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _space(20),
        AccountQuestionCell(
          'Tại sao tôi không đăng ký vay được?',
          onTap: () {
            changeScreen();
          },
        ),
        AccountQuestionCell(
          'Tại sao tôi xác thực được?',
          onTap: () {
            changeScreen();
          },
        ),
        AccountQuestionCell(
          'Bao lâu thì hồ sơ của tôi được duyệt?',
          onTap: () {
            changeScreen();
          },
        ),
        AccountQuestionCell(
          'Tại sao tôi không đăng ký vay được?',
          onTap: () {
            changeScreen();
          },
        ),
        AccountQuestionCell(
          'Tại sao tôi xác thực được?',
          onTap: () {
            changeScreen();
          },
        ),
        AccountQuestionCell(
          'Bao lâu thì hồ sơ của tôi được duyệt?',
          onTap: () {
            changeScreen();
          },
        )
      ],
    );
  }

  Widget _space(double space) {
    return SizedBox(
      height: space,
    );
  }
}
