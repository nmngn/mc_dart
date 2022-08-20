import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatelessWidget(),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF3F5AA6),
            title: const Text("Title text"),
          ),
          bottomNavigationBar: menu(),
          body: TabBarView(
            children: [
              Container(child: Icon(Icons.directions_car)),
              Container(child: Icon(Icons.directions_transit)),
              Container(child: Icon(Icons.directions_bike)),
              Container(child: Icon(Icons.directions_bike)),
            ],
          ),
        ),
      ),
    );
  }
}

Widget menu() {
  return Container(
      color: Colors.transparent,
      child: const TabBar(
        labelColor: Colors.black,
        unselectedLabelColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(5),
        labelPadding: EdgeInsets.only(left: 2, right: 2, bottom: 5),
        labelStyle: TextStyle(fontSize: 13
        ),
        indicatorColor: Colors.blue,
        tabs: [
          Tab(
            text: "Màn hình chính",
            icon: Icon(Icons.home),
          ),
          Tab(
            text: "Tìm kiếm",
            icon: Icon(Icons.search),
          ),
          Tab(
            text: "Thông báo",
            icon: Icon(Icons.notifications),
          ),
          Tab(
            text: "Thông tin cá nhân",
            icon: Icon(Icons.person),
          ),
        ],
      ));
}
