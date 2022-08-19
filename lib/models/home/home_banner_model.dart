import 'package:mc_dart/models/base_response.dart';

class HomeBannerResponseModel extends BaseModel {
  List<BannerModel> banners;
  HomeBannerResponseModel({required this.banners});

  factory HomeBannerResponseModel.fromJson(Map<String, dynamic> json) {
    return HomeBannerResponseModel(
        banners: List.of(json["banners"])
            .map((m) => BannerModel.fromJson(m))
            .toList());
  }
}

class BannerModel extends BaseModel {
  final int id;
  final String imageUrl;
  final String title;
  final String router;
  final String url;

  BannerModel(
      {required this.id,
      required this.imageUrl,
      required this.router,
      required this.title,
      required this.url});

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json["id"],
      imageUrl: json["imageUrl"],
      title: json["imageUrl"],
      router: json["router"],
      url: json["url"],
    );
  }
}
