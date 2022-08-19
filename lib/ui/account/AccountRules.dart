import 'package:flutter/material.dart';
import 'package:mc_dart/constants/assets.dart';

class AccountRuleScreen extends StatefulWidget {
  @override
  _AccountRuleScreenState createState() => _AccountRuleScreenState();
}

class _AccountRuleScreenState extends State<AccountRuleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text('Điều khoản',
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet<void>(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                builder: (BuildContext context) {
                  return _popupRule(context);
                },
              );
            },
            child: Container(
              height: 64,
              margin: const EdgeInsets.only(top: 20, left: 16, right: 16),
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffDEE3E7)),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: ListTile(
                  leading: Image.asset(
                    Assets.icUserRule,
                    height: 40,
                    width: 40,
                  ),
                  title: const Text(
                    'Điều khoản sử dụng',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  trailing: Image.asset(
                    Assets.icRightArrow,
                    height: 16,
                    width: 16,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 64,
              margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffDEE3E7)),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: ListTile(
                  leading: Image.asset(
                    Assets.icPrivacy,
                    height: 40,
                    width: 40,
                  ),
                  title: const Text(
                    'Chính sách bảo mật',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  trailing: Image.asset(
                    Assets.icRightArrow,
                    height: 16,
                    width: 16,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget _popupRule(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height / 5 * 3,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: Colors.black.withAlpha(60))),
            ),
            child: const Center(
              child: Text('Điều khoản sử dụng',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            )),
        Container(
          margin: const EdgeInsets.only(top: 14, left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'ĐIỀU KHOẢN SỬ DỤNG DỊCH VỤ',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Các điều khoản sử dụng dịch vụ hiển thị dưới đây (sau đây gọi là “Điều khoản sử dụng dịch vụ”, hoặc “Điều Khoản Sử Dụng”) quy định các điều khoản và điều kiện được đồng ý bởi và giữa Công ty Cổ phần 9Pay (sau đây gọi tắt là “Công ty”, hoặc “9Pay”, hoặc “chúng tôi”) và khách hàng cùng đơn vị chấp nhận thanh toán về việc, hoặc có liên quan tới việc cung cấp, sử dụng dịch vụ trung gian thanh toán được cung ứng bởi Công ty (sau đây gọi tắt là “Dịch vụ”).\nĐiều 1. Giải thích từ ngữ\n\nTrừ trường hợp ngữ cảnh cụ thể có quy định khác, các từ ngữ dưới đây được hiểu như sau:\na. Dịch vụ trung gian thanh toán (Dịch vụ TGTT): được hiểu là Dịch vụ cổng thanh toán 9Pay, Dịch vụ hỗ trợ thu hộ, chi hộ và Dịch vụ ví điện tử.\nb. Đơn vị chấp nhận thanh toán (ĐVCNTT): Là các tổ chức hoặc cá nhân cung ứng hàng hoá, dịch vụ chấp nhận cho khách hàng thanh toán tiền mua hàng hóa, dịch vụ thông qua Dịch vụ TGTT.\nc. Website/ứng dụng thương mại điện tử  hoặc “9Pay”, hoặc “chúng tôi”) và khách hàng cùng đơn vị',
                style: TextStyle(fontSize: 15),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
