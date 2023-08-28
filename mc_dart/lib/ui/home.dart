import 'package:flutter/material.dart';
import 'package:mc_dart/ui/detail.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 247, 248, 1),
      body: _buildListView(),
    );
  }

  Widget _buildListView() {
    return ListView.separated(
        itemBuilder: (context, position) {
          return _buildItem(position);
        },
        separatorBuilder: (context, position) {
          return const Divider(
            color: Colors.transparent,
          );
        },
        itemCount: 6);
  }

  Widget _buildItem(int position) {
    switch (position) {
      case 0:
        return Container(
          margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: _cellProfile(),
        );
      case 1:
        return Container(
          margin: const EdgeInsets.only(left: 12, right: 12),
          child: _cellAddItem(),
        );
      case 2:
        return _cellText('Dự kiến sinh trong tháng này( 0)');
      case 3:
        return _cellText('Tất cả( 10)');
      case 4:
        return _cellItem();
      case 5:
        return _cellItem();
      default:
        return Container();
    }
  }

  Widget _cellProfile() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xffE8EBEE)),
          borderRadius: BorderRadius.circular(10)),
      height: 138,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 12, right: 12, top: 12),
            child: const Text(
              "Xin chào",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 12, right: 12, top: 12),
            child: const Text(
              "Chúc bạn một ngày tốt lành !",
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 12, right: 12, top: 12),
            child: const Text(
              "Bạn hiện đang có tất cả 15 sản phụ",
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 12, right: 12, top: 12),
            child: const Text(
              "Có 3 sản phụ dự kiến sinh trong tháng này",
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }

  Widget _cellAddItem() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xffE8EBEE)),
          borderRadius: BorderRadius.circular(10)),
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 12, right: 12),
          ),
          const Text(
            'Thêm thông tin mới',
            style: TextStyle(fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }

  Widget _cellText(String text) {
    return Container(
      height: 24,
      margin: const EdgeInsets.only(left: 16, right: 16),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
    );
  }

  Widget _cellItem() {
    return GestureDetector(
      onTap: () => {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const DetailView()))
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xffE8EBEE))),
        height: 64,
        margin: const EdgeInsets.only(left: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 16,
            ),
            const SizedBox(width: 12),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text("Name"), Text("0919908021")],
            ),
            const Spacer(),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [Text("24D1G"), Text("0919908021")],
            ),
            const SizedBox(
              width: 12,
            ),
            Container(
              margin: const EdgeInsets.only(right: 12),
            )
          ],
        ),
      ),
    );
  }
}
