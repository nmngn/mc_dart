class ProductInfo {
  String? status;
  String? message;
  List? data;

  ProductInfo({this.status, this.message, this.data});

  factory ProductInfo.fromMap(Map<String, dynamic> json) => ProductInfo(
        status: json["status"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toMap() =>
      {"status": status, "message": message, "data": data};
}

class BannerProductInfo {
  String? type;
  String? imageUrl;

  BannerProductInfo({this.type, this.imageUrl});

  factory BannerProductInfo.fromMap(Map<String, dynamic> json) =>
      BannerProductInfo(
        type: json["type"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "imageUrl": imageUrl,
      };
}

class SubProduct {
  String? name;
  String? description;
  String? type;
  List? items;

  SubProduct({this.name, this.description, this.items, this.type});

  factory SubProduct.fromMap(Map<String, dynamic> json) => SubProduct(
      type: json["type"],
      name: json["name"],
      description: json["description"],
      items: json["items"]);

  Map<String, dynamic> toMap() =>
      {"type": type, "name": name, "description": description, "items": items};
}

class DetailProductInfo {
  int? id;
  String? name;
  String? imageUrl;
  String? type;
  String? status;
  int? productId;

  DetailProductInfo(
      {this.id,
      this.name,
      this.imageUrl,
      this.productId,
      this.status,
      this.type});

  factory DetailProductInfo.fromMap(Map<String, dynamic> json) =>
      DetailProductInfo(
          type: json["type"],
          name: json["name"],
          id: json["id"],
          imageUrl: json["imageUrl"],
          status: json["status"],
          productId: json["productId"]);

  Map<String, dynamic> toMap() => {
        "type": type,
        "name": name,
        "id": id,
        "imageUrl": imageUrl,
        "status": status,
        "productId": productId
      };
}

class ProgressProduct {
  String? name;
  String? description;
  String? type;
  List? items;

  ProgressProduct({this.name, this.description, this.items, this.type});

  factory ProgressProduct.fromMap(Map<String, dynamic> json) => ProgressProduct(
      type: json["type"],
      name: json["name"],
      description: json["description"],
      items: json["items"]);

  Map<String, dynamic> toMap() =>
      {"type": type, "name": name, "description": description, "items": items};
}