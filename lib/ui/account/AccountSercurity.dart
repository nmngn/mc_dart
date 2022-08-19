import 'package:flutter/material.dart';
import 'package:mc_dart/constants/assets.dart';
import 'package:mc_dart/ui/HomeView/HomeSubViews/HomeHeaderView.dart';
import 'package:mc_dart/ui/common_view/AccountItemWidget.dart';
import 'package:mc_dart/ui/common_view/HeaderWidget.dart';
import 'package:mc_dart/ui/common_view/header_login_widget.dart';
import 'package:mc_dart/ui/common_view/loan_type_widget.dart';
import 'package:mc_dart/utils/routes/routes.dart';

class AccountSercurityScreen extends StatefulWidget {
  @override
  _AccountSercurityScreenState createState() => _AccountSercurityScreenState();
}

class _AccountSercurityScreenState extends State<AccountSercurityScreen> {
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
          SafeArea(child: _buildChildAppBar(),
          ),
          GestureDetector(
            onTap: (){
              print("Open change password");
              Navigator.of(context).pushNamed(Routes.changePassword);
            },
            child:  Container(
              child: AccountItemWidget("Doi mat khau", false),
              margin: EdgeInsets.only(bottom: 16, top: 16),
          ),),
          AccountItemWidget("Xac thuc sinh trac hoc", true)
        ],
      ),
    );
  }
 

  Widget _buildChildAppBar() {
    return HeaderWidget('Cai dat bao mat', false);
  }
}
