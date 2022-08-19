import 'package:flutter/material.dart';
import 'package:mc_dart/constants/assets.dart';
import 'package:mc_dart/ui/common_view/HeaderWidget.dart';
import 'package:mc_dart/utils/routes/routes.dart';
import 'package:mc_dart/ui/account/AccountQuestion.dart';

import '../common_view/lib/AccountQuestionCell.dart';

class AccountSupportScreen extends StatefulWidget {
  @override
  _AccountSupportScreenState createState() => _AccountSupportScreenState();
}

class _AccountSupportScreenState extends State<AccountSupportScreen> {
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
          child: _buildChildAppBar(),
          bottom: false,
        ),
        Container(
          child: _buildChildBody(),
        ),
      ],
    );
  }

  Widget _buildChildAppBar() {
    return HeaderWidget('Trung tâm trợ giúp', false);
  }

  void changeScreen() {
    Navigator.of(context).pushNamed(Routes.accountAnswer);
  }

  Widget _buildChildBody() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: ListTile(
              leading: const Text(
                'Các vấn đề thường gặp',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              trailing: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.accountQuestion);
                },
                child: const Text(
                  'Xem tất cả',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff1BC5AC)),
                ),
              ),
            ),
          ),
          AccountQuestionCell(
            'Tại sao tôi không đăng ký vay được?',
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
            'Bao lâu thì hồ sơ của tôi được duyệt?',
            onTap: () {
              changeScreen();
            },
          ),
          _cellSpace(18),
          Container(
            margin: const EdgeInsets.only(left: 16, right: 16),
            child: const Text(
              'Bạn cần hỗ trợ',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ),
          _cellSpace(8),
          ListTile(
            leading: Image.asset(
              Assets.icHotline,
              height: 32,
              width: 32,
            ),
            title: const Text('Tổng đài CSKH'),
            trailing: const Text(
              '1900.1199',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 16, right: 16),
            child: const Divider(
              thickness: 1,
            ),
          ),
          ListTile(
            leading: Image.asset(
              Assets.icMail,
              height: 32,
              width: 32,
            ),
            title: const Text('Email'),
            trailing: const Text(
              'cskh@xproject.ai',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 16, right: 16),
            child: const Divider(
              thickness: 1,
            ),
          ),
          ListTile(
            leading: Image.asset(
              Assets.icZalo,
              height: 32,
              width: 32,
            ),
            title: const Text('Zalo'),
            trailing: const Text(
              '1900.1199',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 16, right: 16),
            child: const Divider(
              thickness: 1,
            ),
          ),
          _cellSpace(12),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(Routes.accountForm);
            },
            child: Container(
              margin: const EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffD3F6F1)),
              child: Container(
                margin: const EdgeInsets.only(top: 4),
                child: ListTile(
                  leading: const Text('Hoặc gửi yêu cầu trợ giúp'),
                  trailing: Image.asset(
                    Assets.icGreenArror,
                    height: 16,
                    width: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _cellSpace(double space) {
  return SizedBox(
    height: space,
  );
}
