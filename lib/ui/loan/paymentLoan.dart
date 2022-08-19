import 'package:flutter/material.dart';
import 'package:mc_dart/ui/common_view/BottomButton.dart';
import 'package:mc_dart/utils/routes/routes.dart';
import '../../constants/assets.dart';

class PaymentLoanScreen extends StatefulWidget {
  @override
  _PaymentLoanScreenState createState() => _PaymentLoanScreenState();
}

class _PaymentLoanScreenState extends State<PaymentLoanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: const Text('Thanh toán khoản vay',
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
      itemCount: 8);
}

Widget _buildItem(int position, BuildContext context) {
  switch (position) {
    case 0:
      return Container(
        child: _cellPayment(context),
        margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
      );
    case 1:
      return Container(
        margin: const EdgeInsets.only(left: 16),
        child: const Text(
          'Thông tin chuyển khoản',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
      );
    case 2:
      return Container(
        margin: const EdgeInsets.only(left: 16, right: 16),
        child: _infoTransfer(),
      );
    case 3:
      return Container(
        margin: const EdgeInsets.only(left: 16, right: 16),
        child: _smallerCell(),
      );
    case 4:
      return Container(
        margin: const EdgeInsets.only(left: 16, right: 16),
        child: _contentPayment(),
      );
    case 5:
      return Container(
        margin: const EdgeInsets.only(left: 16, right: 16),
        child: _tutorialText(),
      );
    case 6:
      return Container(
        margin: const EdgeInsets.only(left: 16, right: 16),
        child: BottomButtonCell('Xác nhận chuyển khoản', const Color(0xff1BC5AC), ontap: () {
          Navigator.of(context).pushNamed(Routes.resultLoan);
        },)
      );
    default:
      return Container();
  }
}

Widget _sizeBox(double height) {
  return SizedBox(
    height: height,
  );
}

Widget _cellPayment(BuildContext context) {
  return Container(
    height: 285,
    decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffE8EBEE)),
        borderRadius: BorderRadius.circular(10)),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          width: double.infinity,
          child: Container(
            margin: const EdgeInsets.only(left: 12, top: 8),
            child: const Text(
              'Số tiền thanh toán nợ',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Container(
            margin: const EdgeInsets.only(left: 12, top: 10),
            child: const Text(
              '12.380.000đ',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff1BC5AC)),
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Container(
            margin: const EdgeInsets.only(left: 12, top: 20),
            child: const Text(
              'Chọn nguồn tiền',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Container(
            margin: const EdgeInsets.only(left: 12, top: 20),
          ),
        ),
        Container(
          height: 60,
          margin: const EdgeInsets.only(top: 12, left: 16, right: 16),
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffE8EBEE)),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 16),
                child: Image.asset(
                  Assets.icUnselect,
                  width: 20,
                  height: 20,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 11, top: 11, bottom: 11),
                child: Image.asset(
                  Assets.icNewBank,
                  width: 38,
                  height: 38,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 8, top: 11, bottom: 11, right: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Chuyển khoản qua ngân hàng',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                    _sizeBox(4),
                    const Text(
                      'Chuyển khoản qua MB Bank',
                      style: TextStyle(fontSize: 11),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          height: 60,
          margin: const EdgeInsets.only(top: 12, left: 16, right: 16),
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffE8EBEE)),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 16),
                child: Image.asset(
                  Assets.icSelected,
                  width: 20,
                  height: 20,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 11, top: 11, bottom: 11),
                child: Image.asset(
                  Assets.icWallet,
                  width: 38,
                  height: 38,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 8, top: 11, bottom: 11, right: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Ví Credita',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                    _sizeBox(4),
                    const Text(
                      'Số dư ví: 123.4563.789đ',
                      style: TextStyle(fontSize: 11),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget _infoTransfer() {
  return Container(
    height: 202,
    decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffCDD4DB)),
        borderRadius: BorderRadius.circular(10)),
    child: Column(
      children: [
        Container(
          height: 72,
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Color((0xffCDD4DB))))),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(
              flex: 5,
              child: Container(
                margin: const EdgeInsets.only(left: 14),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Số tài khoản', style: TextStyle(fontSize: 11)),
                    _sizeBox(4),
                    const Text('21210001039468',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Container(
                    height: 44,
                    width: 95,
                    margin: const EdgeInsets.only(right: 14),
                    child: GestureDetector(
                      onTap: () {
                        print('clicked');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xff1BC5AC)),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                          child: Text(
                            'Sao chép',
                            style: TextStyle(
                                color: Color(0xff1BC5AC),
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    )))
          ]),
        ),
        Container(
          height: 63,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Color(0xffF6F7F8),
              border: Border(bottom: BorderSide(color: Color((0xffCDD4DB))))),
          child: Container(
            margin: const EdgeInsets.only(left: 14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Ngân hàng thụ hưởng',
                    style: TextStyle(fontSize: 11)),
                _sizeBox(4),
                const Text('Ngân hàng quân đội MB Bank ',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500))
              ],
            ),
          ),
        ),
        Container(
          height: 63,
          width: double.infinity,
          decoration: const BoxDecoration(color: Color(0xffF6F7F8)),
          child: Container(
            margin: const EdgeInsets.only(left: 14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Chủ tài khoản', style: TextStyle(fontSize: 11)),
                _sizeBox(4),
                const Text('Công ty cổ phần X-Project JSC',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500))
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _smallerCell() {
  return Container(
      height: 72,
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffCDD4DB)),
          color: const Color(0xffF6F7F8),
          borderRadius: BorderRadius.circular(10)),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Expanded(
          flex: 5,
          child: Container(
            margin: const EdgeInsets.only(left: 14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Số tiền cần thanh toán',
                    style: TextStyle(fontSize: 11)),
                _sizeBox(4),
                Row(
                  children: [
                    Image.asset(
                      Assets.icCoin,
                      width: 14,
                      height: 14,
                    ),
                    const Text('   23.123.526',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
            flex: 2,
            child: Container(
                height: 44,
                width: 95,
                margin: const EdgeInsets.only(right: 14),
                child: GestureDetector(
                  onTap: () {
                    print('clicked');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff1BC5AC)),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text(
                        'Sao chép',
                        style: TextStyle(
                            color: Color(0xff1BC5AC),
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                )))
      ]));
}

Widget _contentPayment() {
  return Container(
      height: 72,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/img_border.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Expanded(
          flex: 5,
          child: Container(
            margin: const EdgeInsets.only(left: 14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Nội dung chuyển khoản',
                    style: TextStyle(fontSize: 11)),
                _sizeBox(4),
                const Text('XPJ0798333444',
                    style: TextStyle(
                        color: Color(0xff1BC5AC),
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
        Expanded(
            flex: 2,
            child: Container(
                height: 44,
                width: 95,
                margin: const EdgeInsets.only(right: 14),
                child: GestureDetector(
                  onTap: () {
                    print('clicked');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff1BC5AC)),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text(
                        'Sao chép',
                        style: TextStyle(
                            color: Color(0xff1BC5AC),
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                )))
      ]));
}

Widget _tutorialText() {
  return const Text(
      'Bạn phải nhập đúng nội dung chuyển khoản để giao dịch được tự động ghi nhận.',
      style: TextStyle(fontSize: 13));
}
