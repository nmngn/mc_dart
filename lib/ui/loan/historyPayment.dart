import 'package:flutter/material.dart';
import '../../constants/assets.dart';

class HistoryPaymentScreen extends StatefulWidget {
  @override
  _HistoryPaymentState createState() => _HistoryPaymentState();
}

class _HistoryPaymentState extends State<HistoryPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text('Lịch sử thanh toán',
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        leading: IconButton(
          icon: Image.asset(
            Assets.icBack,
            width: 24,
            height: 24,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
      ),
      body: _body(),
    );
  }
}

Widget _body() {
  return Container(
    height: 387,
    margin: const EdgeInsets.only(top: 20, left: 16, right: 16),
    decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffE8EBEE)),
        borderRadius: BorderRadius.circular(10)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _cellBody(),
        _cellBody(),
        _cellBody(),
        _cellBody(),
        _cellBody(isLast: true)
      ],
    ),
  );
}

Widget _cellBody({isLast = false}) {
  var _color = const Color(0xffE8EBEE);
  if (isLast == true) {
    _color = Colors.transparent;
  }
  return Container(
    height: 63,
    margin: const EdgeInsets.only(top: 12, left: 16, right: 16),
    decoration:
        BoxDecoration(border: Border(bottom: BorderSide(color: _color))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('18/01/2021', style: TextStyle(fontSize: 15)),
              Text('Khoản vay kỳ 1/12',
                  style: TextStyle(fontSize: 15, color: Color(0xff5C616F))),
            ],
          ),
        ),
        const Expanded(
            flex: 1,
            child: Center(
              child: Text('600.000đ',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(0xff5C616F),
                      fontWeight: FontWeight.bold)),
            ))
      ],
    ),
  );
}
