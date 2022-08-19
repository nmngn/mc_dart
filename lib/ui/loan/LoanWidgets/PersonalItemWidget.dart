import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:mc_dart/ui/loan/LoanWidgets/InputRadioWifget.dart';
import 'package:mc_dart/ui/loan/LoanWidgets/InputSelectWidget.dart';
import 'package:mc_dart/ui/loan/LoanWidgets/InputTextWidget.dart';

class PersonalItemWidget extends StatefulWidget {
  @override
  _PersonalItemWidgetState createState() => _PersonalItemWidgetState();
}

class _PersonalItemWidgetState extends State<PersonalItemWidget> {
  late TextEditingController _hoTen;
  late TextEditingController _city;

  @override
  void initState() {
    super.initState();
    _hoTen = TextEditingController();
    _city = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return _buildMain();
  }

  Widget _buildMain() {
    var listView = ListView(
      primary: false,
      shrinkWrap: true,
      children: [
        _buildTitle(),
        SizedBox(
          height: 10,
        ),
        InputTextWidget(
          "Ho va ten",
          "Nhap ho va ten",
          _hoTen,
        ),
        InputRadioWidget(
          "Gioi tinh",
        ),
        InputSelectWidget("Tinh/Thanh pho", "Chon tinh/ thanh pho", _city),
      ],
    );
    return listView;
  }

  Widget _buildTitle() {
    var text = "Thông tin cá nhân";
    var title = Text(
      text,
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
    );
    return title;
  }
}
