import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mc_dart/constants/assets.dart';

class ProductLoanCellWidget extends StatefulWidget {
  @override
  _ProductLoanCellWidgetState createState() => _ProductLoanCellWidgetState();
}

class _ProductLoanCellWidgetState extends State<ProductLoanCellWidget> {
  @override
  Widget build(BuildContext context) {
    return _buildMain();
  }

  Widget _buildMain() {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Colors.white),
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildLogo(),
            Expanded(
              child: _buildContent(),
              flex: 1,
            ),
            _buildRightButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    var image = Image.asset(
      Assets.icSalaryLoan,
      width: 44,
      height: 44,
    );
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 12, top: 12),
      child: image,
    );
  }

  Widget _buildContent() {
    var title = Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(bottom: 5),
      child: Text(
        "Vay nhanh tien mat",
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
    );

    var content = Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(bottom: 5),
      child: Text(
        "Giai ngan nhanh, dap ung nhu cau cap bach",
        style: TextStyle(fontSize: 13),
      ),
    );

    var bottomContent = Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(child: _buildBottomContent("5-30tr")),
          Flexible(
            child: _buildBottomContent("6-36 Thang"),
          ),
          Flexible(
            child: _buildBottomContent("20-60 tuoi"),
          ),
        ],
      ),
    );

    return Container(
      margin: EdgeInsets.only(left: 10, top: 10, bottom: 15),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [title, content, bottomContent],
      ),
    );
  }

  Widget _buildRightButton() {
    var arrow = Image.asset(
      Assets.icRightButton,
      width: 16,
      height: 16,
    );
    return Container(
      margin: EdgeInsets.only(right: 11),
      child: arrow,
    );
  }

  Widget _buildBottomContent(String data) {
    var icon = Image.asset(
      Assets.icMoney,
      width: 12,
      height: 12,
    );
    var content = Container(
      child: Flexible(
          child: Text(
        data,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 11),
      )),
    );
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Row(
        children: [
          icon,
          SizedBox(
            width: 5,
          ),
          content
        ],
      ),
    );
  }
}
