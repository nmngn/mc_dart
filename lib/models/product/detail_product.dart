
class DetailProduct {
  int? id;
  String? name;
  int? minAmount;
  int? maxAmount;
  int? minPeriod;
  int? maxPeriod;
  String? periodType;
  int? minAge;
  int? maxAge;
  String? image;
  String? banner;
  String? description;
  String? condition;
  double? rate;
  String? rateType;
  String? status;
  String? createDate;
  String? updateDate;
  bool? prepaidFee;
  bool? prepaidRate;
  bool? oneTimePayment;
  bool? limitCheck;
  String? targets;
  int? fees;
  String? groups;
  String? position;
  int? amount;

  DetailProduct(
      {this.id,
      this.name,
      this.minAmount,
      this.maxAmount,
      this.minPeriod,
      this.maxPeriod,
      this.periodType,
      this.minAge,
      this.maxAge,
      this.image,
      this.banner,
      this.description,
      this.condition,
      this.rate,
      this.rateType,
      this.status,
      this.createDate,
      this.updateDate,
      this.prepaidFee,
      this.prepaidRate,
      this.oneTimePayment,
      this.limitCheck,
      this.targets,
      this.fees,
      this.groups,
      this.position,
      this.amount});

  factory DetailProduct.fromMap(Map<String, dynamic> json) => DetailProduct(
        id: json["id"],
        name: json["name"],
        minAmount: json["minAmount"],
        maxAmount: json["maxAmount"],
        minPeriod: json["minPeriod"],
        maxPeriod: json["maxPeriod"],
        periodType: json["periodType"],
        minAge: json["minAge"],
        maxAge: json["maxAge"],
        image: json["image"],
        banner: json["banner"],
        description: json["description"],
        condition: json["condition"],
        rate: json["rate"],
        rateType: json["rateType"],
        status: json["status"],
        createDate: json["createDate"],
        updateDate: json["updateDate"],
        prepaidFee: json["prepaidFee"],
        prepaidRate: json["prepaidRate"],
        oneTimePayment: json["oneTimePayment"],
        limitCheck: json["limitCheck"],
        targets: json["targets"],
        fees: json["fees"],
        groups: json["groups"],
        position: json["position"],
        amount: json["amount"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "minAmount": minAmount,
        "maxAmount": maxAmount,
        "minPeriod": minPeriod,
        "maxPeriod": maxPeriod,
        "periodType": periodType,
        "minAge": minAge,
        "maxAge": maxAge,
        "image": image,
        "banner": banner,
        "description": description,
        "condition": condition,
        "rate": rate,
        "rateType": rateType,
        "status": status,
        "createDate": createDate,
        "updateDate": updateDate,
        "prepaidFee": prepaidFee,
        "prepaidRate": prepaidRate,
        "oneTimePayment": oneTimePayment,
        "limitCheck": limitCheck,
        "targets": targets,
        "fees": fees,
        "groups": groups,
        "position": position,
        "amount": amount,
      };
}
