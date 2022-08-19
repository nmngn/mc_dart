import 'package:mc_dart/constants/assets.dart';
import 'package:mc_dart/ui/account/account.dart';
import 'package:flutter/material.dart';
import 'package:mc_dart/ui/home/home.dart';
import 'package:mc_dart/ui/loan/loan.dart';
import '../notification/notification.dart';

class TabBarScreen extends StatefulWidget {
  @override
  _TabBarScreen createState() => _TabBarScreen();
}

class _TabBarScreen extends State<TabBarScreen> {
  PageController pageController = PageController();
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    LoanScreen(),
    NotificationScreen(),
    AccountScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  // set viewController
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    print(index);
  }

  Widget _buildBottomNavBar() {
    return Stack(
      children: <Widget>[
        BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(Assets.icNavHome)),
                activeIcon: ImageIcon(AssetImage(Assets.icNavHomeActive)),
                label: 'Trang chủ',
                backgroundColor: Colors.transparent),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(Assets.icNavLoan)),
              activeIcon: ImageIcon(AssetImage(Assets.icNavLoanActive)),
              backgroundColor: Colors.transparent,
              label: 'Khoản vay',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(Assets.icNavNoti)),
              activeIcon: ImageIcon(AssetImage(Assets.icNavNotiActive)),
              label: 'Thông báo',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(Assets.icNavAccount)),
              activeIcon: ImageIcon(AssetImage(Assets.icNavAccountActive)),
              label: 'Tài khoản',
            )
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          showUnselectedLabels: true,
          showSelectedLabels: true,
        ),
      ],
    );
  }
}
