import 'package:flutter/material.dart';
import 'package:mc_dart/ui/common_view/BottomButton.dart';
import 'package:mc_dart/utils/routes/routes.dart';
import '../../constants/assets.dart';

class ResultLoanScreen extends StatefulWidget {
  @override
  _ResultLoanScreenState createState() => _ResultLoanScreenState();
}

class _ResultLoanScreenState extends State<ResultLoanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _childBody());
  }

  Widget _childBody() {
    return Column(
      children: [
        Flexible(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                Assets.imageResult,
                height: 165,
                width: 165,
              ),
              const Text(
                'Thanh toán thành công',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              const Text(
                'Số tiền 23.123.526 của bạn \nđã được thanh toán.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
              ),
            ],
          ),
        )),
        _noteCell(),
        BottomButtonCell(
          'Về trang chủ',
          const Color(0xff1BC5AC),
          ontap: () {
            Navigator.of(context).pushNamed(Routes.home);
          },
        )
      ],
    );
  }

  Widget _noteCell() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('• Nội dung chuyển khoản chỉ có giá trị 1 lần.',
              style: TextStyle(fontSize: 13, color: Color(0xff5C616F))),
          Text('• Ngân hàng MB Bank chỉ hỗ trợ xử lý tự động từ 08-20h. ',
              style: TextStyle(fontSize: 13, color: Color(0xff5C616F))),
          Text(
              '• Mọi thắc mắc vui lòng gửi yêu cầu tại mục Hỗ trợ trên ứng dụng.',
              style: TextStyle(fontSize: 13, color: Color(0xff5C616F))),
        ],
      ),
    );
  }
}
