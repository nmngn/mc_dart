import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mc_dart/models/product/product_info.dart';
import 'package:mc_dart/ui/common_view/AdvantageLoanWidget.dart';
import 'package:mc_dart/ui/common_view/HeaderWidget.dart';
import 'package:mc_dart/ui/common_view/ProductLoanCellWidget.dart';
import 'package:mc_dart/ui/loan/loanDetail.dart';
import '../../constants/assets.dart';
import 'package:mc_dart/utils/routes/routes.dart';

class DetailCreateLoanScreen extends StatefulWidget {
  @override
  _DetailCreateLoanScreenState createState() => _DetailCreateLoanScreenState();
}

class _DetailCreateLoanScreenState extends State<DetailCreateLoanScreen> {
  late BannerProductInfo banner = BannerProductInfo();
  late SubProduct subProduct = SubProduct();
  late ProgressProduct progressProduct = ProgressProduct();

  void setupData(ProductInfo? value) {
    var model = value!.data!;
    for (var i = 0; i < value.data!.length; i++) {
      print('i = ${i}');
      if (model[i]['type'] == 'BANNER') {
        banner = BannerProductInfo.fromMap(model[i]);
      } else if (model[i]['type'] == 'LIST') {
        subProduct = SubProduct.fromMap(model[i]);
      } else if (model[i]['type'] == 'LIST_PROGRESS') {
        progressProduct = ProgressProduct.fromMap(model[i]);
      }
    }
  }

  @override
  void initState() {
    super.initState();
        setState(() {
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: _buildMain(),
        ));
  }

  Widget _buildMain() {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          _buildAppBar(),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: _buildListView(),
            ),
          )
        ]));
  }

  Widget _buildAppBar() {
    return SafeArea(
      child: HeaderWidget("Vay tiền mặt", false),
    );
  }

  Widget _buildBanner() {
    var width = MediaQuery.of(context).size.width - 32;
    var image = Image.asset(
      Assets.bgHome,
      width: width,
      height: width / 2,
    );

    if (banner.imageUrl != null) {
      ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          banner.imageUrl!,
          height: 150.0,
          width: 100.0,
        ),
      );
    }
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(top: 16),
      child: image,
    );
  }

  Widget _buildBottomButton() {
    return Container(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFF1BC5AC)),
          child: TextButton(
            child: const Text(
              "Đăng ký vay",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              print("Continue");
              Navigator.of(context).pushNamed(Routes.createLoanRequest);
            },
          ),
          height: 44,
          width: MediaQuery.of(context).size.width - 32,
          padding: const EdgeInsets.only(left: 20, right: 20),
          margin: const EdgeInsets.only(top: 10, bottom: 10),
        ),
      ),
    );
  }

  Widget _buildListView() {
    var listView = Container(
        child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, position) {
              return _buildItem(position);
            },
            separatorBuilder: (context, position) {
              return const Divider(
                color: Colors.transparent,
              );
            },
            itemCount: 5));
    return Column(
      children: [Expanded(child: listView), _buildBottomButton()],
    );
  }

  Widget _buildItem(int index) {
    switch (index) {
      case 0:
        return _buildBanner();
      case 1:
        if (subProduct.name?.isEmpty == false) {
          return _buildTitle(subProduct.name!);
        }
        return _buildTitle("");
      case 2:
        return _buildAdvantage();
      case 3:
        if (progressProduct.name?.isEmpty == false) {
          return _buildTitle(progressProduct.name!);
        }
        return _buildTitle("");
      case 4:
        return _buildProcedure();
      default:
        return Container();
    }
  }

  Widget _buildAdvantage() {
    List<AdvantageLoanCellWidget> list = [];
    var listStrength =
        subProduct.items?.map((e) => DetailProductInfo.fromMap(e)).toList();

    if (listStrength?.isEmpty == false) {
      for (var item in listStrength!) {
        list.add(AdvantageLoanCellWidget(item.imageUrl ?? "", item.name ?? ""));
      }
    }

    var listAdvantage = Container(
      child: GridView.count(
        primary: false,
        shrinkWrap: true,
        crossAxisCount: 3,
        crossAxisSpacing: 60,
        mainAxisSpacing: 15,
        children: list,
      ),
    );
    return listAdvantage;
  }

  Widget _buildProcedure() {
    var listProgress = progressProduct.items
        ?.map((e) => DetailProductInfo.fromMap(e))
        .toList();

    if (listProgress?.isEmpty == false) {
      listProgress!.asMap();
      return Row(
        children: [
          Expanded(
            child: _buildItemProcedure(
                listProgress[0].imageUrl!, listProgress[0].name!, true),
            flex: 1,
          ),
          Expanded(
            child: _buildItemProcedure(
                listProgress[1].imageUrl!, listProgress[1].name!, false,
                isMid: true),
            flex: 1,
          ),
          Expanded(
            child: _buildItemProcedure(
                listProgress[2].imageUrl!, listProgress[2].name!, false),
            flex: 1,
          ),
        ],
      );
    }

    return Container();
  }

  Widget _buildItemProcedure(String imageUrl, String title, bool isFirst,
      {bool isMid = false}) {
    var img = Image.network(imageUrl, height: 48, width: 48);
    var colorLeft;
    var colorRight;

    if (isMid) {
      colorLeft = const Color(0xFF1BC5AC);
      colorRight = const Color(0xFFDEE3E7);
    } else if (isFirst) {
      colorLeft = Colors.transparent;
      colorRight = const Color(0xFF1BC5AC);
    } else {
      colorLeft = const Color(0xFFDEE3E7);
      colorRight = Colors.transparent;
    }
    var icon = Container(
      margin: const EdgeInsets.only(top: 8, bottom: 5),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 2,
              decoration: BoxDecoration(color: colorLeft),
            ),
            flex: 1,
          ),
          Image.asset(
            isFirst ? Assets.icDotActive : Assets.icDot,
            width: 20,
            height: 20,
          ),
          Expanded(
            child: Container(
              height: 2,
              decoration: BoxDecoration(color: colorRight),
            ),
            flex: 1,
          ),
        ],
      ),
    );
    var content = Text(
      title,
      textAlign: TextAlign.center,
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [img, icon, content],
    );
  }

  Widget _buildTitle(String title) {
    var body = Text(
      title,
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
    );
    return Container(
      alignment: Alignment.topLeft,
      child: body,
    );
  }
}
