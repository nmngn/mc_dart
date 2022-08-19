import 'package:flutter/material.dart';
import 'package:mc_dart/constants/assets.dart';

class SelectTypeWidget extends StatelessWidget {
  late String _leftTitle;
  late String _righTitle;

  SelectTypeWidget(String leftTitle, String rightTitle) {
    this._leftTitle = leftTitle;
    this._righTitle = rightTitle;
  }

  @override
  Widget build(BuildContext context) {
    return _buildPurpose();
  }

  Widget _buildPurpose() {
    var leftTitle = Text(
      this._leftTitle,
      textAlign: TextAlign.left,
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
    );
    var rightTitle = Text(
      this._righTitle,
      textAlign: TextAlign.right,
      style: TextStyle(fontSize: 15),
    );
    var rightIcon = Image.asset(
      Assets.icRightButton,
      width: 16,
      height: 16,
    );
    return GestureDetector(
      onTap: () {
        print("tap open bottom sheet");
      },
      child: Container(
        child: Row(
          children: [
            Expanded(
              child: leftTitle,
              flex: 1,
            ),
            Expanded(
              child: rightTitle,
              flex: 1,
            ),
            rightIcon,
          ],
        ),
      ),
    );
  }
}
