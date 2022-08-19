import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mc_dart/ui/common_view/HeaderWidget.dart';
import 'package:mc_dart/ui/common_view/ProductLoanCellWidget.dart';
import 'package:mc_dart/ui/loan/loanDetail.dart';
import '../../constants/assets.dart';
import 'package:mc_dart/utils/routes/routes.dart';

class ProductLoanScreen extends StatefulWidget {
  @override
  _ProductLoanScreenState createState() => _ProductLoanScreenState();
}

class _ProductLoanScreenState extends State<ProductLoanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      body: _buildMain(),
    );
  }

  Widget _buildMain() {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          _buildAppBar(),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: _buildListItem(),
            ),
          )
        ]));
  }

  Widget _buildAppBar() {
    return SafeArea(
      child: HeaderWidget("Sản phẩm vay", false),
    );
  }

  Widget _buildListItem() {
    return Container(
        child: ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            print("index: " + index.toString());
            Navigator.of(context).pushNamed(Routes.createLoan);
          },
          child: ProductLoanCellWidget(),
        );
      },
    ));
  }
}
