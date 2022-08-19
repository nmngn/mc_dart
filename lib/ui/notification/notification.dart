import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mc_dart/constants/assets.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildListView(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      title: const Text('Thông báo',
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black)),
      centerTitle: true,
    );
  }

  Widget spacing(double height) {
    return SizedBox(height: height);
  }

  Widget _buildListView() {
    return ListView.separated(
        itemBuilder: (context, position) {
          return _buildItem(position, context);
        },
        separatorBuilder: (context, position) {
          return const Divider(
            color: Colors.transparent,
          );
        },
        itemCount: 6);
  }

  Widget _buildItem(int position, BuildContext context) {
    switch (position) {
      case 0:
        return spacing(4);
      case 1:
        return Container(
          child: _biggerCell(),
        );
      case 2:
        return Container(
          child: _biggerCell(),
        );
      case 3:
        return Container(
          child: _biggerCell(),
        );
      case 4:
        return Container(
          child: _smallerCell(),
        );
      default:
        return spacing(12);
    }
  }

  Widget _biggerCell() {
    return Container(
      height: 111,
      margin: const EdgeInsets.only(left: 16, right: 16),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xffE8EBEE))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            Assets.icNotiBell,
            height: 32,
            width: 32,
          ),
          const SizedBox(width: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              spacing(8),
              const Text('Bạn đang sở hữu kho quà từ Project...',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
              spacing(8),
              const Text(
                  'Tham gia ngay cuộc thi ABC của chúng \ntôi để dành những phần quà hấp dẫn',
                  maxLines: 2,
                  style: TextStyle(fontSize: 15)),
              spacing(8),
              const Text('16:11 14/10/2021',
                  maxLines: 2,
                  style: TextStyle(fontSize: 15, color: Color(0xff5C616F))),
            ],
          )
        ],
      ),
    );
  }

  Widget _smallerCell() {
    return Container(
      height: 48,
      margin: const EdgeInsets.only(left: 16, right: 16),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xffE8EBEE))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            Assets.icNotiDown,
            height: 32,
            width: 32,
          ),
          const SizedBox(width: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Giải ngân',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
              Text('16:11 14/10/2021',
                  maxLines: 2,
                  style: TextStyle(fontSize: 15, color: Color(0xff5C616F))),
            ],
          ),
          new Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text('+10.150.000',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
              Text('Thành công',
                  style: TextStyle(fontSize: 15, color: Color(0xff1BC5AC))),
            ],
          ),
        ],
      ),
    );
  }
}
