import 'package:flutter/material.dart';
import 'package:mc_dart/constants/assets.dart';

class AccountQuestionCell extends StatefulWidget {
  late String _question;
  late VoidCallback? _onTap ;

  AccountQuestionCell(String question, {VoidCallback? onTap}) {
    _question = question;
    _onTap = onTap;
  }

  @override
  AQCell createState() => AQCell();
}

class AQCell extends State<AccountQuestionCell> {
  @override
  Widget build(BuildContext context) {
    return _cellQuestion(widget._question);
  }

  Widget _cellQuestion(String text) {
    return GestureDetector(
      onTap: () {
        widget._onTap!();
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffDEE3E7)),
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          title: Text(
            text,
            textAlign: TextAlign.left,
          ),
          trailing: Image.asset(
            Assets.icRightArrow,
            height: 16,
            width: 16,
          ),
        ),
      ),
    );
  }
}
