import 'package:mc_dart/models/home/home_banner_model.dart';

abstract class BaseModel {
  BaseModel();
  BaseModel.fromJson(dynamic json);
}

class BaseResponseModel extends BaseModel {
  final String status;
  final String message;
  final dynamic data;

  BaseResponseModel(
      {required this.status, required this.message, required this.data});

  factory BaseResponseModel.fromJson(
    dynamic json,
  ) {
    return BaseResponseModel(
        status: json["status"], message: json["message"], data: json["data"]);
  }

  T? getData<T>() {
    if (T == HomeBannerResponseModel) {
      print("parse data HomeBannerModel");
      return HomeBannerResponseModel.fromJson(data) as T;
    }
  }
}
