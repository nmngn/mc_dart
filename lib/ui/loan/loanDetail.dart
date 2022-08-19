import 'package:flutter/material.dart';
import '../../constants/assets.dart';
import '../../utils/routes/routes.dart';
import '../common_view/BottomLineInfoCell.dart';
import '../common_view/SingleInfoLine.dart';

class LoanDetailScreen extends StatefulWidget {
  @override
  _LoanDetailScreenState createState() => _LoanDetailScreenState();
}

class _LoanDetailScreenState extends State<LoanDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: const Text('Chi tiết khoản vay',
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
        body: _buildListView(context));
  }
}

Widget _buildListView(BuildContext context) {
  return ListView.separated(
      itemBuilder: (context, position) {
        return _buildItem(position, context);
      },
      separatorBuilder: (context, position) {
        return const Divider(
          color: Colors.transparent,
        );
      },
      itemCount: 7);
}

Widget _buildItem(int position, BuildContext context) {
  switch (position) {
    case 0:
      return Container(
        child: _cellReturnNow(context),
        margin: const EdgeInsets.only(top: 20, left: 16, right: 16),
      );
    case 1:
      return Container(
        child: _cellPaymentPeriod(context),
        margin: const EdgeInsets.only(left: 16, right: 16),
      );
    case 2:
      return Container(
        child: _cellPaymentHistory(context),
        margin: const EdgeInsets.only(left: 16, right: 16),
      );
    case 3:
      return Container(
        child: _cellTitle(),
        margin: const EdgeInsets.only(left: 16, right: 16),
      );
    case 4:
      return Container(
        child: _cellStatusInfoLoan(),
        margin: const EdgeInsets.only(left: 16, right: 16),
      );
    case 5:
      return Container(
        child: _cellInfoLoan(),
        margin: const EdgeInsets.only(left: 16, right: 16),
      );
    default:
      return _sizeBox(16);
  }
}

Widget _cellReturnNow(BuildContext context) {
  return Container(
    child: Container(
      height: 244,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xff6ce2d1)),
          color: Color(0xfff0fcfa)),
      child: Column(
        children: [
          SingleInfoLineCell(
            'Số tiền thanh toán',
            '1.000.000',
            fontWeight: FontWeight.bold,
          ),
          _sizeBox(8),
          SingleInfoLineCell('Kỳ tiếp theo', '01/01/2021'),
          _sizeBox(8),
          SingleInfoLineCell('Khoản vay', '5.000.000đ'),
          _sizeBox(8),
          SingleInfoLineCell('Kỳ thanh toán', '02/12 kỳ'),
          _sizeBox(8),
          SingleInfoLineCell(
            'Số hợp đồng',
            'AVBFEI2348',
            fontWeight: FontWeight.bold,
          ),
          _sizeBox(24),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(Routes.paymentLoan);
            },
            child: Container(
              height: 44,
              margin: const EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xff1bc5ac),
              ),
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  'Trả ngay',
                  style: TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget _sizeBox(double height) {
  return SizedBox(
    height: height,
  );
}

Widget _cellPaymentPeriod(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).pushNamed(Routes.periodPayment);
    },
    child: Container(
      height: 58,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xffe8ebee)),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListTile(
              leading: Image.asset(
                Assets.icCalendar,
                width: 24,
                height: 24,
              ),
              trailing: Image.asset(
                Assets.icRightButton,
                width: 24,
                height: 24,
              ),
              title: const Text(
                'Kỳ thanh toán',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _cellPaymentHistory(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).pushNamed(Routes.historyPayment);
    },
    child: Container(
      height: 58,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xffe8ebee)),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListTile(
              leading: Image.asset(
                Assets.icHistory,
                width: 24,
                height: 24,
              ),
              trailing: Image.asset(
                Assets.icRightButton,
                width: 24,
                height: 24,
              ),
              title: const Text(
                'Lịch sử thanh toán',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _cellTitle() {
  return const SizedBox(
    child: Text(
      'Thông tin khoản vay',
      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
    ),
  );
}

Widget _cellInfoLoan() {
  return Container(
    height: 400,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xffe8ebee))),
    child: Column(
      children: [
        BottomLineInfoCell('Số hợp đồng', 'AVBFEI2348', fontWeight: FontWeight.bold),
        BottomLineInfoCell('Ngày tạo', ' 01/01/2020'),
        BottomLineInfoCell('Số tiền vay', '1.000.000đ'),
        BottomLineInfoCell('Kỳ hạn vay', '12 tháng'),
        BottomLineInfoCell('Trả hàng tháng', '100.000đ'),
        BottomLineInfoCell('Mục đích vay', 'Vay tiêu dùng'),
        BottomLineInfoCell('Sản phẩm vay', 'Vay nhanh tiền mặt'),
        GestureDetector(
          onTap: () {
            print('clicked');
          },
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            child: const Text(
              'Xem chi tiết hợp đồng (PDF)',
              style: TextStyle(
                  color: Color(0xff1BC5AC),
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    ),
  );
}

Widget _cellStatusInfoLoan() {
  return Container(
    height: 382,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xffe8ebee))),
    child: Column(
      children: [
        Container(
          height: 44,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(9), topRight: Radius.circular(9)),
            border: Border.all(color: const Color(0xffe8ebee)),
            color: const Color(0xfff6f7f8),
          ),
          child: const Align(
            alignment: Alignment.center,
            child: Text('Đã từ chối',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          ),
        ),
        BottomLineInfoCell('Số hợp đồng', 'AVBFEI2348', fontWeight: FontWeight.bold),
        BottomLineInfoCell('Ngày tạo', ' 01/01/2020'),
        BottomLineInfoCell('Số tiền vay', '1.000.000đ'),
        BottomLineInfoCell('Kỳ hạn vay', '12 tháng'),
        BottomLineInfoCell('Trả hàng tháng', '100.000đ'),
        BottomLineInfoCell('Mục đích vay', 'Vay tiêu dùng'),
        BottomLineInfoCell('Sản phẩm vay', 'Vay nhanh tiền mặt', isLast: true),
      ],
    ),
  );
}
