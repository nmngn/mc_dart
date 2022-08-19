import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mc_dart/constants/assets.dart';
import 'package:mc_dart/ui/common_view/AdvantageLoanWidget.dart';
import 'package:mc_dart/ui/common_view/HeaderWidget.dart';
import 'package:mc_dart/ui/common_view/HeaderWidget2.dart';
import 'package:mc_dart/ui/common_view/ProductLoanCellWidget.dart';
import 'package:mc_dart/ui/loan/LoanWidgets/InputMoneyWidget.dart';
import 'package:mc_dart/ui/loan/LoanWidgets/SelectTypeWidget.dart';
import 'package:mc_dart/ui/loan/loanDetail.dart';
import 'package:mc_dart/utils/routes/routes.dart';

class CreateLoanRequestScreen extends StatefulWidget {
  @override
  _CreateLoanRequestScreenState createState() =>
      _CreateLoanRequestScreenState();
}

class _CreateLoanRequestScreenState extends State<CreateLoanRequestScreen> {
  var listMoney = ["5", "10", "15", "20", "25", "30", "40", "50"];
  bool isSelectList = true;
  var selectedIndex = 1;
  var timeLoan = "6 thang";
  var installment = "1.500.000";

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
      backgroundColor: Colors.white,
      body: SafeArea(child: _buildMain()),
    );
  }

  Widget _buildMain() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(children: [
          _buildAppBar(),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
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
    var listView = ListView.separated(
        itemBuilder: (context, position) {
          return _buildItem(position);
        },
        separatorBuilder: (context, position) {
          return const Divider(
            color: Colors.transparent,
          );
        },
        itemCount: 7);

    return Column(
      children: [Expanded(child: listView), _buildBottomButton()],
    );
  }

  Widget _buildItem(int index) {
    var money = isSelectList ? listMoney[selectedIndex] + ".000.000" : "123123";
    switch (index) {
      case 0:
        return SelectTypeWidget("Mục đích vay", "Vay tiền mặt");
      case 1:
        return _buildLevelLoan();
      case 2:
        return InputMoneyWidget(money);
      case 3:
        return _buildListMoney();
      case 4:
        return _buildSupport();
      case 5:
        return _buildTimeLoan();
      case 6:
        return _buildInstallment();
    }
    return Container();
  }

  Widget _buildLevelLoan() {
    var leftTitle = Text(
      "So tien can vay",
      textAlign: TextAlign.left,
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
    );
    var rightTitle = Text(
      "Han muc 5 trieu ~ 100 trieu",
      textAlign: TextAlign.right,
      maxLines: 1,
      style: TextStyle(fontSize: 13),
    );
    return Container(
      child: Row(
        children: [
          leftTitle,
          Expanded(
            child: rightTitle,
            flex: 1,
          ),
        ],
      ),
    );
  }

  Widget _buildListMoney() {
    var list = <Widget>[];
    for (int i = 0; i < listMoney.length; i++) {
      list.add(_buildItemMoney(i));
    }
    return Container(
      child: GridView.extent(
        primary: false,
        shrinkWrap: true,
        maxCrossAxisExtent: 110,
        crossAxisSpacing: 7,
        mainAxisSpacing: 16,
        childAspectRatio: 110 / 38,
        children: list,
      ),
    );
  }

  Widget _buildItemMoney(int index) {
    var text = listMoney[index] + " trieu";
    var title = Container(
      margin: EdgeInsets.only(top: 8, bottom: 8),
      child: Text(
        text,
        maxLines: 1,
      ),
    );
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: isSelectList
                ? (index == selectedIndex ? Color(0xFF1BC5AC) : Colors.white)
                : Colors.white,
            borderRadius: BorderRadius.circular(6)),
        child: title,
      ),
    );
  }

  Widget _buildSupport() {
    var leftTitle = Text(
      "Dieu khoan vay",
      textAlign: TextAlign.left,
      style: TextStyle(
          fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF1BC5AC)),
    );
    var rightTitle = Text(
      "Cau hoi thuong gap?",
      textAlign: TextAlign.right,
      maxLines: 1,
      style: TextStyle(
          fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF1BC5AC)),
    );
    return Container(
      child: Row(
        children: [
          leftTitle,
          Expanded(
            child: rightTitle,
            flex: 1,
          ),
        ],
      ),
    );
  }

  Widget _buildTimeLoan() {
    var rightButton = Container(
      alignment: Alignment.topRight,
      child: Image.asset(
        Assets.icRightButton,
        width: 20,
        height: 20,
      ),
    );

    var iconTime = Image.asset(
      Assets.icTime,
      width: 24,
      height: 24,
    );
    var text = Container(
      margin: EdgeInsets.only(left: 6),
      child: Text(
        timeLoan,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );

    var item = Row(
      children: [
        iconTime,
        Expanded(child: text),
        rightButton,
      ],
    );

    var title = Container(
      margin: EdgeInsets.only(bottom: 10),
      alignment: Alignment.topLeft,
      child: Text(
        "Thoi han vay",
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
    return Column(
      children: [title, item],
    );
  }

  Widget _buildInstallment() {
    var rightButton = Container(
      child: Image.asset(
        Assets.icRightButton,
        width: 20,
        height: 20,
      ),
    );

    var iconTime = Image.asset(
      Assets.icVnd,
      width: 24,
      height: 24,
    );
    var text = Container(
      margin: EdgeInsets.only(left: 6),
      child: Text(
        installment + " VND",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );

    var item = Row(
      children: [
        iconTime,
        text,
        rightButton,
      ],
    );

    var title = Container(
      margin: EdgeInsets.only(bottom: 10),
      alignment: Alignment.topLeft,
      child: Text(
        "Tính sơ bộ khoản trả góp hàng tháng",
        style: TextStyle(
          fontSize: 15,
        ),
      ),
    );
    return Column(
      children: [title, item],
    );
  }

  Widget _buildBottomButton() {
    return Container(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFF1BC5AC)),
          child: TextButton(
            child: Text(
              "Đăng ký vay",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              print("Continue");
              Navigator.of(context).pushNamed(Routes.loanInfomation);
            },
          ),
          height: 44,
          width: MediaQuery.of(context).size.width - 32,
          padding: EdgeInsets.only(left: 20, right: 20),
          margin: EdgeInsets.only(top: 10, bottom: 10),
        ),
      ),
    );
  }
}
