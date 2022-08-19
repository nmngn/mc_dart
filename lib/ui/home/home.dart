
import 'package:mc_dart/constants/assets.dart';
import 'package:mc_dart/ui/common_view/account_verify_widget.dart';
import 'package:mc_dart/ui/common_view/loan_type_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      actions: _buildActions(context),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    return <Widget>[
      _buildProfile(),
      _buildBody(),
    ];
  }

  Widget _buildProfile() {
    var imageProfile = Container(
      child: Image.asset(
        Assets.profileEmpty,
        width: 40,
        height: 40,
      ),
    );

    return Row(
      children: <Widget>[
        Expanded(
          child: imageProfile,
          flex: 1,
        ),
        Expanded(
          child: Column(children: const <Widget>[
            Text('Name'),
            Text('Phone'),
          ]),
        )
      ],
    );
  }

  Widget _buildBody() {
    var imageProfile = ClipRRect(
      child: Image.asset(
        Assets.carBackground,
        fit: BoxFit.cover,
        width: 40,
        height: 40,
      ),
      borderRadius: BorderRadius.circular(20),
    );

    var userInfo = Expanded(
        child: Padding(
      padding: EdgeInsets.only(left: 10, top: 12),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text(
              'Name',
              textAlign: TextAlign.left,
            ),
            Text('Phone', textAlign: TextAlign.left),
          ]),
    ));
    return Stack(
      children: [
        _buildListView(),
        Container(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              imageProfile,
              userInfo,
              Align(
                child: AccountVerifyWidget(" xac thuc ", "success"),
                alignment: Alignment.centerRight,
              )
            ],
          ),
          height: 60,
          margin: EdgeInsets.only(left: 10),
        ),
      ],
    );
  }

  Widget _buildListView() {
    return ListView.separated(
        itemBuilder: (context, position) {
          return _buildItem(position);
        },
        separatorBuilder: (context, position) {
          return Divider();
        },
        itemCount: 6);
  }

  Widget _buildItem(int position) {
    switch (position) {
      case 0:
        return Container(
          child: _buildCellNotActive(),
          margin: EdgeInsets.only(top: 40),
        );
      case 1:
        return Container(
          child: _buildCellLoan(),
          margin: EdgeInsets.only(left: 12, right: 12),
        );
      case 2:
        return _buildCellSlider();
      case 3:
        return _buildCellListLoan();
      case 4:
        return _buildCellListLoan();
      case 5:
        return _buildCellListLoan();
      default:
        return Container(
          child: _buildCellNotActive(),
          margin: EdgeInsets.only(top: 40),
        );
    }
  }

  Widget _buildCellNotActive() {
    var bgHome = ClipRRect(
      child: Image.asset(
        Assets.bgHome,
        fit: BoxFit.cover,
        height: 174,
        width: MediaQuery.of(context).size.width,
      ),
      borderRadius: BorderRadius.circular(10),
    );

    var bgSearch = ClipRRect(
      child: Image.asset(
        Assets.bgSearchHome,
        fit: BoxFit.cover,
        width: 72,
        height: 72,
      ),
      borderRadius: BorderRadius.circular(36),
    );

    var backGround = SizedBox(
      child: Stack(
        children: <Widget>[
          bgHome,
          Container(
            height: 174,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: const LinearGradient(
                      colors: [
                        Color(0xFFAFFFF2),
                        Color(0xFFFBFFFE),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
                child: TextButton(
                  child: Text("Bắt đầu ngay"),
                  onPressed: () {},
                ),
                height: 36,
                padding: EdgeInsets.only(left: 20, right: 20),
                margin: EdgeInsets.only(bottom: 20),
              ),
            ),
          ),
          Container(
            child: bgSearch,
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(top: 21, right: 12),
          ),
          SizedBox(
            width: 244,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    "Xác Thực tài khoản",
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "Xac thuc tai khoan de hoan thien ho so dang ki vay cua ban ngay!",
                    textAlign: TextAlign.left,
                  )
                ],
              ),
              margin: EdgeInsets.only(left: 12, top: 20),
            ),
          )
        ],
      ),
    );

    return Container(
        child: backGround, margin: EdgeInsets.only(left: 16, right: 16));
  }

  Widget _buildCellActive() {
    return ClipRRect(
      child: Image.asset(
        Assets.carBackground,
        fit: BoxFit.cover,
        width: 40,
        height: 40,
      ),
      borderRadius: BorderRadius.circular(20),
    );
  }

  Widget _buildCellLoan() {
    return SizedBox(
        height: 114,
        child: Row(
          children: [
            Expanded(
              child: Card(
                child: Container(
                    child: Column(
                      children: [
                        Image.asset(
                          Assets.icLoan,
                          height: 31,
                          width: 31,
                        ),
                        Text("vay tien"),
                        Text("da dang muc dich")
                      ],
                    ),
                    margin: EdgeInsets.only(top: 16)),
              ),
              flex: 1,
            ),
            Expanded(
              child: Card(
                child: Container(
                    child: Column(
                      children: [
                        Image.asset(
                          Assets.icPay,
                          height: 31,
                          width: 47,
                        ),
                        Text("Tra no"),
                        Text("Thanh toan dinh ki")
                      ],
                    ),
                    margin: EdgeInsets.only(top: 16)),
              ),
              flex: 1,
            ),
          ],
        ));
  }

  Widget _buildCellSlider() {
    return ImageSlideshow(
      width: double.infinity,
      height: 200,
      children: [
        Image.asset(
          Assets.carBackground,
          fit: BoxFit.cover,
        ),
        Image.asset(
          Assets.bgTest,
          fit: BoxFit.cover,
        ),
        Image.asset(
          Assets.bgHome,
          fit: BoxFit.cover,
        ),
      ],
      autoPlayInterval: 3000,

      /// Loops back to first slide.
      isLoop: true,
      onPageChanged: (value) {
        // print('Page changed: $value');
      },
      initialPage: 0,
    );
  }

  Widget _buildCellListLoan() {
    return LoanTypeWidget();
  }
}
