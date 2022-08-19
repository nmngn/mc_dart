class Wallet {
  int? id;
  double? balance;
  double? waiting;
  double? pending;
  double? freezing;
  String? interest;
  String? type;
  String? status;
  String? createDate;
  String? updateDate;

  Wallet(
      {this.id,
      this.balance,
      this.waiting,
      this.pending,
      this.freezing,
      this.interest,
      this.type,
      this.status,
      this.createDate,
      this.updateDate});

  factory Wallet.fromMap(Map<String, dynamic> json) => Wallet(
        id: json["id"],
        balance: json["balance"],
        waiting: json["waiting"],
        pending: json["pending"],
        freezing: json["freezing"],
        interest: json["interest"],
        type: json["type"],
        status: json["status"],
        createDate: json["createDate"],
        updateDate: json["updateDate"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "balance": balance,
        "waiting": waiting,
        "pending": pending,
        "freezing": freezing,
        "interest": interest,
        "type": type,
        "status": status,
        "createDate": createDate,
        "updateDate": updateDate
      };
}
