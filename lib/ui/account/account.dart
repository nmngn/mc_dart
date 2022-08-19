import 'package:flutter/material.dart';
import 'package:mc_dart/constants/assets.dart';
import 'package:mc_dart/ui/HomeView/HomeSubViews/HomeHeaderView.dart';
import 'package:mc_dart/ui/common_view/loan_type_widget.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  var accountType = ['/bank', '/cecurity', '/rule', '/support', '/first_login'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        _buildCellAccount("Tai khoan ngan hang", accountType[0]),
        _buildCellAccount("Cai dat bao mat", accountType[1]),
        _buildCellAccount("Dieu khoan & Su dung", accountType[2]),
        _buildCellAccount("Trung tam ho tro", accountType[3]),
        _buildCellAccount("Dang xuat", accountType[4]),
      ],
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      elevation: 0,
      toolbarHeight: 66, // Set this height
      flexibleSpace: Align(
        alignment: Alignment.topLeft, // and bottomLeft
        child: SafeArea(
          child: HomeHeaderView(),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildMainView() {
    const double padding = 16.0;
    double viewHeight = 70.0 + padding;
    return Container(
        width: double.infinity,
        height: viewHeight,
        margin:
            const EdgeInsets.only(left: padding, right: padding, top: padding),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(8),
            color: Colors.white),
        child: Row(
          children: <Widget>[
            Container(
                alignment: Alignment.centerLeft,
                height: 40,
                width: 40,
                margin: const EdgeInsets.only(left: padding),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.homeSubViewAuthBg),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(10),
                )),
            Expanded(
                child: Container(
                    margin: const EdgeInsets.only(
                        left: padding, right: padding, top: padding),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "TOP ADDED askdfhkajsdhf akdjfhajksdhf asjkdfh",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ))),
            Container(
                alignment: Alignment.centerRight,
                height: 16,
                width: 16,
                margin: const EdgeInsets.only(right: padding),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.homeSubViewItemNext),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(10),
                )),
          ],
        ));
  }

  Widget _buildCellAccount(String title, String type) {
    var icon = Image.asset(
      Assets.icQuickLoan,
      width: 42,
      height: 42,
    );

    var content = Container(
      margin: EdgeInsets.only(left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title), // title
        ],
      ),
    );

    var rightArrow = Image.asset(
      Assets.icRightButton,
      width: 16,
      height: 16,
    );

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(type);
      },
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16),
        margin: EdgeInsets.only(top: 16, bottom: 16),
        child: Row(
          children: [
            icon,
            Expanded(
              child: content,
              flex: 1,
            ),
            rightArrow
          ],
        ),
      ),
    );
  }
}
