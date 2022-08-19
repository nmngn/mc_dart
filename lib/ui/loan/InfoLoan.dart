import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:mc_dart/constants/assets.dart';
import 'package:mc_dart/ui/common_view/BottomButton.dart';
import 'package:mc_dart/ui/common_view/BottomLineInfoCell.dart';

class InfoLoanScreen extends StatefulWidget {
  @override
  _InfoLoanScreenState createState() => _InfoLoanScreenState();
}

class _InfoLoanScreenState extends State<InfoLoanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        SafeArea(
          bottom: false,
          child: _buildChildAppBar(),
        ),
        Expanded(
          child: _buildChildBody(),
        )
      ],
    );
  }

  Widget _buildChildAppBar() {
    return SafeArea(
        top: true,
        bottom: false,
        child: Container(
          height: 54,
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Color(0xffE8EBEE), width: 1))),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Image.asset(
                    Assets.icBack,
                    height: 16,
                    width: 16,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 12),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text('Thông tin khoản vay',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    Text('Bước 3/3: Xác nhận khoản vay',
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w200,
                            color: Colors.black)),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget _buildChildBody() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 16, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffE8EBEE)),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                const SizedBox(
                  height: 12,
                ),
                BottomLineInfoCell(
                  'Số hợp đồng',
                  'AVBFEI2348',
                  fontWeight: FontWeight.bold,
                ),
                BottomLineInfoCell('Ngày tạo', '01/01/2020'),
                BottomLineInfoCell('Số tiền vay', '1.000.000đ'),
                BottomLineInfoCell('Kỳ hạn vay', '12 tháng'),
                BottomLineInfoCell('Tiền trả hàng tháng (Dự kiến)', '100.000đ'),
                BottomLineInfoCell('Mục đích vay', 'Tiêu dùng'),
                BottomLineInfoCell('Tên người vay', 'Đào Hoàng Tuần'),
                BottomLineInfoCell(
                  'Số điện thoại',
                  '0979 665177',
                  isLast: true,
                ),
              ],
            ),
          ),
          _titleCheck(),
          Expanded(child: BottomButtonCell("Gửi hồ sơ vay", const Color(0xff1BC5AC),ontap: () {
            print('tapped');
          },))
        ],
      ),
    );
  }

  Widget _titleCheck() {
    return Container(
      margin: const EdgeInsets.only(top: 12, right: 16),
      child: SizedBox(
          height: 44,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                Assets.icSelected,
                height: 20,
                width: 20,
              ),
              const SizedBox(
                width: 8,
              ),
              const Text(
                  'Tôi đã hiểu và đồng ý với điều khoản vay của\n ứng dụng'),
            ],
          )),
    );
  }
}
