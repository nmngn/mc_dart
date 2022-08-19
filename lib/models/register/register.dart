class Register {
  String? status;
  String? message;
  DataRegister? data;

  Register({
    this.status,
    this.message,
    this.data,
  });

  factory Register.fromMap(Map<String, dynamic> json) => Register(
        status: json["status"],
        message: json["message"],
        data: DataRegister.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "mesage": message,
        "data": data,
      };
}

class DataRegister {
  String? userName;
  String? email;
  String? phone;
  String? photo;
  String? fullName;
  String? city;
  String? status;
  String? action;
  String? type;
  int? id;
  int? lockCount;
  String? statusName;

  DataRegister(
      {this.userName,
      this.email,
      this.phone,
      this.photo,
      this.fullName,
      this.city,
      this.status,
      this.action,
      this.type,
      this.id,
      this.lockCount,
      this.statusName});

  factory DataRegister.fromMap(Map<String, dynamic> json) => DataRegister(
        userName: json["username"],
        email: json["email"],
        phone: json["phone"],
        photo: json["photo"],
        fullName: json["fullName"],
        city: json["city"],
        status: json["status"],
        action: json["action"],
        type: json["type"],
        id: json["id"],
        lockCount: json["lockCount"],
        statusName: json["statusName"],
      );

  Map<String, dynamic> toMap() => {
        "username": userName,
        "email": email,
        "phone": phone,
        "photo": photo,
        "fullName": fullName,
        "city": city,
        "status": status,
        "action": action,
        "type": type,
        "id": id,
        "lockCount": lockCount,
        "statusName": statusName
      };
}
