import 'package:flutter/cupertino.dart';
import 'package:mc_dart/constants/assets.dart';

class AccountVerifyWidget extends StatefulWidget {
  late String _state;
  late String _title;

  AccountVerifyWidget(String title, String state) {
    this._state = state;
    this._title = title;
  }
  @override
  _AccountVerifyWidget createState() => _AccountVerifyWidget();
}

class _AccountVerifyWidget extends State<AccountVerifyWidget> {
  @override
  Widget build(BuildContext context) {
    return widget._state == "complete"
        ? _buildRightButton()
        : _buildRightButtonActive();
  }

  Widget _buildRightButton() {
    var bgButton = Image.asset(
      Assets.icRightButton,
      width: 16,
      height: 16,
    );

    var rightButton = Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0)),
          gradient: LinearGradient(
              colors: [
                const Color(0xFFAFFFF2),
                const Color(0xFFFBFFFE),
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        height: 32,
        child: Row(
          children: <Widget>[
            Padding(
              child: Text(
                widget._title,
                textAlign: TextAlign.left,
              ),
              padding: EdgeInsets.only(left: 10),
            ),
            bgButton
          ],
        ));

    return rightButton;
  }

  Widget _buildRightButtonActive() {
    var bgButton = Image.asset(
      Assets.icActive,
      width: 24,
      height: 24,
    );

    var rightButton = Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              colors: [
                const Color(0xFFAFFFF2),
                const Color(0xFFFBFFFE),
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        height: 32,
        child: Row(
          children: <Widget>[
            Padding(
              child: bgButton,
              padding: EdgeInsets.only(left: 7),
            ),
            Padding(
              child: Text(
                widget._title,
                textAlign: TextAlign.left,
              ),
              padding: EdgeInsets.only(left: 5),
            ),
          ],
        ));

    return rightButton;
  }
}
