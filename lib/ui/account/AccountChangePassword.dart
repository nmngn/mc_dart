import 'package:flutter/material.dart';
import 'package:mc_dart/constants/assets.dart';
import 'package:mc_dart/ui/HomeView/HomeSubViews/HomeHeaderView.dart';
import 'package:mc_dart/ui/common_view/HeaderWidget.dart';
import 'package:mc_dart/ui/common_view/header_login_widget.dart';
import 'package:mc_dart/ui/common_view/input_password_widget.dart';
import 'package:mc_dart/ui/common_view/loan_type_widget.dart';

class AccountChangePasswordScreen extends StatefulWidget {
  @override
  _AccountChangePasswordScreenState createState() => _AccountChangePasswordScreenState();
}

class _AccountChangePasswordScreenState extends State<AccountChangePasswordScreen> {
  late TextEditingController _oldPassword;
  late TextEditingController _newPassword;
  late TextEditingController _confirmPassword;
  late bool _checkNum = false;
  late bool _checkPass = false;

  @override
  void initState() {
    super.initState();
    _oldPassword = TextEditingController();
    _newPassword = TextEditingController();
    _confirmPassword = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

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
            child: _buildItemBody(),
          ), 
        ],
      ),
    );
  } 
 

  Widget _buildChildAppBar() {
    return HeaderWidget('Doi mat khau', false);
  }

  Widget _buildItemBody() {
    return Container( 
      padding: EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Column(children: [
        InputPasswordWidget(
          _oldPassword,
          "mat khau cu", 
        ),
        InputPasswordWidget(
          _newPassword,
          "mat khau moi",
          onChangedText: () {
            setState(() {
              _newPassword.text.length == 6
                  ? _checkNum = true
                  : _checkNum = false;
                  _newPassword.text == _confirmPassword.text
                  ? _checkPass = true
                  : _checkPass = false;
            });
          },
        ),
        InputPasswordWidget(
          _confirmPassword,
          "Nhac lai mat khau",
          onChangedText: () {
            setState(() { 
              _newPassword.text == _confirmPassword.text
                  ? _checkPass = true
                  : _checkPass = false;
            });
          },
        ),
        _buildCheckNum(),
        _buildCheckPass(),
        Expanded(
          child: _buildButton(),
          flex: 1,
        )
      ]),
    );
  }

  Widget _buildCheckNum() {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            margin: EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: _checkNum ? Color(0xFF1BC5AC) : Colors.red),
          ),
          Text(
            "Mat khau gom 6 chu so bat ki",
            style: TextStyle(color: _checkNum ? Color(0xFF1BC5AC) : Colors.red),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckPass() {
    return Container(
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            margin: EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: _checkPass ? Color(0xFF1BC5AC) : Colors.red),
          ),
          Text(
            _checkPass ? "Mat khau trung nhau" : "Mat khau khong trung nhau",
            style:
                TextStyle(color: _checkPass ? Color(0xFF1BC5AC) : Colors.red),
          ),
        ],
      ),
    );
  }

  Widget _buildButton() {
    return Container(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 81, 177, 161),
                  Color.fromARGB(255, 85, 223, 188),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: TextButton(
            child: Text(
              "Tiếp tục",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              print("continue to otp");
            },
          ),
          height: 44,
          width: MediaQuery.of(context).size.width - 32,
          padding: EdgeInsets.only(left: 20, right: 20),
          margin: EdgeInsets.only(top: 10),
        ),
      ),
    );
  }
 
}