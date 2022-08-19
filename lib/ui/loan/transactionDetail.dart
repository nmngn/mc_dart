import 'package:flutter/material.dart';
import '../../constants/assets.dart';

class TransactionDetailScreen extends StatefulWidget {
  @override
  _TransactionDetailScreenState createState() =>
      _TransactionDetailScreenState();
}

class _TransactionDetailScreenState extends State<TransactionDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: const Text('Chi tiết giao dịch',
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
        backgroundColor: const Color(0xffE5E5E5),
        body: _cellResult());
  }
}

Widget _cellResult() {
  return Container(
    height: 386,
    margin: const EdgeInsets.only(top: 20, left: 16, right: 16),
    decoration: BoxDecoration(
      border: Border.all(color: const Color(0xffE8EBEE)),
      borderRadius: BorderRadius.circular(10),
      color: const Color(0xffffffff),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 100,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.icTransactionSuccess,
                  width: 40,
                  height: 40,
                ),
                const SizedBox(
                  height: 6,
                ),
                const Text('Thanh toán thành công',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold))
              ],
            ),
          ),
        ),
        Image.asset(
          Assets.line,
          width: double.infinity,
        ),
        const SizedBox(
          height: 35,
          child: ListTile(
            leading: Text('Mệnh giá thanh toán'),
            title: Align(
              alignment: Alignment.centerRight,
              child: Text('1.000.000đ'),
            ),
          ),
        ),
        const SizedBox(
          height: 35,
          child: ListTile(
            leading: Text('Mã giao dịch'),
            title: Align(
              alignment: Alignment.centerRight,
              child: Text('AVBFEI2348'),
            ),
          ),
        ),
        const SizedBox(
          height: 70,
          child: ListTile(
            leading: Text('Nội dung'),
            title: Align(
              alignment: Alignment.centerRight,
              child: Text('Thanh toán hợp đồng \nAVBFEI2348 kỳ 03'),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 16, right: 16),
          child: Image.asset(
            Assets.lineV2,
          ),
        ),
        const SizedBox(
          height: 35,
          child: ListTile(
            leading: Text('Phí giao dịch'),
            title: Align(
              alignment: Alignment.centerRight,
              child: Text('Miễn phí'),
            ),
          ),
        ),
        const SizedBox(
          height: 50,
          child: ListTile(
            leading: Text(
              'Phí trả chậm',
              style: TextStyle(color: Color(0xffFF3B30)),
            ),
            title: Align(
              alignment: Alignment.centerRight,
              child:
                  Text('100.000đ', style: TextStyle(color: Color(0xffFF3B30))),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 16, right: 16),
          child: Image.asset(
            Assets.lineV2,
          ),
        ),
        const SizedBox(
          height: 30,
          child: ListTile(
            leading: Text('Tổng tiền'),
            title: Align(
              alignment: Alignment.centerRight,
              child: Text('1.100.000đ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            ),
          ),
        ),
      ],
    ),
  );
}
