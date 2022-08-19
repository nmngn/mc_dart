import 'package:mc_dart/models/product/detail_product.dart';

class Product {
  String? status;
  String? message;
  DataProduct? data;

  Product({this.status, this.message, this.data});

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        status: json["status"],
        message: json["message"],
        data: DataProduct.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() =>
      {"status": status, "message": message, "data": data};
}

class DataProduct {
  Paging? paging;
  List? list;

  DataProduct({this.paging, this.list});

  factory DataProduct.fromMap(Map<String, dynamic> json) => DataProduct(
        paging: Paging.fromMap(json["paging"]),
        list: json["list"],
      );

  Map<String, dynamic> toMap() =>
      {"paging": paging, "list": list};
}


class Paging {
  int? page;
  int? size;
  int? totalRows;
  int? totalPages;

  Paging({this.page, this.size, this.totalPages, this.totalRows});

  factory Paging.fromMap(Map<String, dynamic> json) => Paging(
        page: json["page"],
        size: json["size"],
        totalPages: json["totalPages"],
        totalRows: json["totalRows"]
      );

  Map<String, dynamic> toMap() => {
        "page": page,
        "size": size,
        "totalRows": totalRows,
        "totalPages": totalPages
      };
}

