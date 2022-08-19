import 'package:flutter/material.dart';
import 'package:mc_dart/constants/assets.dart';
import 'package:mc_dart/ui/common_view/HeaderWidget.dart';

class AccountFormScreen extends StatefulWidget {
  @override
  _AccountFormScreenState createState() => _AccountFormScreenState();
}

class _AccountFormScreenState extends State<AccountFormScreen> {
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
        Expanded(child: _buildChildBody())
      ],
    );
  }

  Widget _buildChildAppBar() {
    return HeaderWidget('Tạo yêu cầu hỗ trợ', false);
  }

  Widget _buildChildBody() {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16),
      child: Column(children: [
        _buildTop(),
        _space(20),
        Container(
          alignment: Alignment.centerLeft,
          child: const Text(
          'Ảnh mô tả',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),),
        Container(child: _buildCellImage(),
        alignment: Alignment.topLeft,),
        _space(20),
        Expanded(child: _buildBottomButton(context))
      ]),
    );
  }
}

Widget _buildTop() {
  var request = const TextField(
    maxLines: 10,
    decoration: InputDecoration.collapsed(hintText: "Vấn đề của bạn là gì?"),
  );
  return Container(
     margin: const EdgeInsets.only(top: 24),
    child: Stack(
      children: [
        Container(
          height: 122,
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.only(left: 18),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF1BC5AC)),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Container(
            margin: const EdgeInsets.only(top: 16, bottom: 16),
            child: request,
          ),
        ),
        _buildText(),
      ],
    ),
  );
}

Widget _buildCellImage() {
  return Container(
    alignment: Alignment.center,
    height: 111,
    width: 111,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xffDEE3E7))),
    child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.icAddImage,
            height: 36,
            width: 36,
          ),
          _space(8),
          const Text(
            'Chụp ảnh',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          )
        ],
      ),
    
  );
}

Widget _space(double space) {
  return SizedBox(
    height: space,
  );
}

Widget _buildBottomButton(BuildContext context) {
  return SafeArea(
    child: Align(
      alignment: Alignment.bottomCenter,
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
          child: const Text("Gửi yêu cầu", 
          style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
        ),
      ),
    ),
  );
}

Widget _buildText() {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        margin: const EdgeInsets.only(left: 13),
        padding: const EdgeInsets.only(left: 5, right: 5),
        alignment: Alignment.center,
        height: 17,
        decoration: const BoxDecoration(color: Colors.white),
        child: const Text(
          'Mô tả vấn đề của bạn',
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.normal),
        ),
      )
    ],
  );
}
