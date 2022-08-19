import 'package:flutter/material.dart';
import 'package:mc_dart/constants/assets.dart';
import 'package:mc_dart/ui/common_view/HeaderWidget.dart';

class AccountAnswerScreen extends StatefulWidget {
  @override
  _AccountAnswerScreenState createState() => _AccountAnswerScreenState();
}

class _AccountAnswerScreenState extends State<AccountAnswerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SafeArea(
          bottom: false,
          child: _buildChildAppBar(),
        ),
        Expanded(child: _buildChildBody()),
        SafeArea(
          bottom: true,
          child: GestureDetector(
              onTap: () {
                showModalBottomSheet<void>(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  builder: (BuildContext context) {
                    return _popupSupport(context);
                  },
                );
              },
              child: Container(
                margin: const EdgeInsets.only(right: 16, bottom: 16),
                child: Image.asset(
                  Assets.icSupport,
                  height: 64,
                  width: 64,
                ),
              )),
        )
      ],
    );
  }

  Widget _buildChildAppBar() {
    return HeaderWidget('Các vấn đề thường gặp', false);
  }

  Widget _buildChildBody() {
    return Column(
      children: [_cellQuestion(), _cellAnswer()],
    );
  }
}

Widget _space(double height) {
  return SizedBox(
    height: height,
  );
}

Widget _cellQuestion() {
  return Container(
    height: 70,
    margin: const EdgeInsets.only(top: 20, left: 16, right: 16),
    decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffD3F6F1)),
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xffF0FCFA)),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 12,
          ),
          Image.asset(
            Assets.icLamp,
            height: 20,
            width: 25,
          ),
          const SizedBox(
            width: 12,
          ),
          const Text(
            'Tại sao tôi chuyển khoản thành công \nnhưng tiền chưa được cộng vào Ví?',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
        ]),
  );
}

Widget _cellAnswer() {
  return Container(
    margin: const EdgeInsets.only(top: 18, left: 16, right: 16),
    child: const Text('Content'),
  );
}

Widget _popupSupport(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height / 7 * 2,
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
              child: Text('Bạn cần thêm sự trợ giúp',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            )),
        Container(
          margin: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _space(16),
              Container(
                height: 20,
                margin: const EdgeInsets.only(bottom: 4),
                child: const ListTile(
                  leading: Text(
                    'CSKH 8h-18h (T2-T6)',
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 13),
                  ),
                  trailing: Text(
                    'Email',
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ),
              const ListTile(
                leading: Text(
                  '1900 86 68 32',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff1BC5AC)),
                ),
                trailing: Text(
                  'hotro@pay.vn',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff1BC5AC)),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 44,
                  width: MediaQuery.of(context).size.width - 16 * 2,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xff1BC5AC),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text("Gửi yêu cầu hỗ trợ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
