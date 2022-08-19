import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mc_dart/constants/assets.dart';

class LoanTypeWidget extends StatefulWidget {
  @override
  _LoanTypeWidget createState() => _LoanTypeWidget();
}

class _LoanTypeWidget extends State<LoanTypeWidget> {
  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    var icon = Image.asset(
      Assets.icQuickLoan,
      width: 42,
      height: 42,
    );

    var content = Column(
      children: [
        Text("Vay nhanh tiền mặt"), // title
        Text("Giải ngân nhanh, đáp ứng yêu cầu cấp bách") // detail
      ],
    );

    var rightArrow = Image.asset(
      Assets.icRightButton,
      width: 16,
      height: 16,
    );

    return Card(
      child: Row(
        children: [
          icon,
          Expanded(
            child: content,
            flex: 1,
          ),
          rightArrow
        ],
      ),
    );
  }
}
