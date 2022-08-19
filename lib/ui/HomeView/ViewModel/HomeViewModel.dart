import 'package:mc_dart/models/home/home_banner_model.dart';
import 'package:mc_dart/models/product/detail_product.dart';
import 'package:mc_dart/models/product/product_model.dart';

abstract class HomeItemModel {}

class HomeAuthModel extends HomeItemModel {}

class HomeActionModel extends HomeItemModel {}

class HomeBannerModel extends HomeItemModel {
  late List<BannerModel> list;
  HomeBannerModel(List<BannerModel> listBanner) {
    list = listBanner;
  }
}

class HomeLoanItemModel extends HomeItemModel {
  late DetailProduct dataProduct = DetailProduct();
  HomeLoanItemModel(DetailProduct data) {
    dataProduct = data;
  }
}

class HomeTitleModel extends HomeItemModel {}

class HomeNoteViewModel extends HomeItemModel {}
