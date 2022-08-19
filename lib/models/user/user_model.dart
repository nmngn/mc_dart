import 'package:mc_dart/models/User/role_model.dart';
import 'package:mc_dart/models/User/wallet_model.dart';

class User {
  String? username;
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
  String? birthDate;
  String? phoneStatus;
  String? idNumber;
  String? idDate;
  String? idPlace;
  String? homeTown;
  String? gender;
  String? address;
  String? district;
  String? deviceId;
  String? country;
  int? kycScore;
  String? alertStatus;
  String? marriage;
  String? alertType;
  String? refUserId;
  String? note;
  String? linkedBank;
  String? createDate;
  String? updateDate;
  Wallet? wallet;
  List? linkBank;
  String? lockDate;
  String? role;
  List<Roles>? roles;
  String? listRoles;
  String? birthDateDay;
  int? age;
  String? fullAddress;
  String? statusName;

  User(
      {this.username,
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
      this.birthDate,
      this.phoneStatus,
      this.idNumber,
      this.idDate,
      this.idPlace,
      this.homeTown,
      this.gender,
      this.address,
      this.district,
      this.deviceId,
      this.country,
      this.kycScore,
      this.alertStatus,
      this.marriage,
      this.alertType,
      this.refUserId,
      this.note,
      this.linkedBank,
      this.createDate,
      this.updateDate,
      this.wallet,
      this.linkBank,
      this.lockDate,
      this.role,
      this.roles,
      this.listRoles,
      this.birthDateDay,
      this.age,
      this.fullAddress,
      this.statusName});

  factory User.fromMap(Map<String, dynamic> json) => User(
      username: json["username"],
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
      birthDate: json["birthDate"],
      phoneStatus: json["phoneStatus"],
      idNumber: json["idNumber"],
      idDate: json["idDate"],
      idPlace: json["idPlace"],
      homeTown: json["homeTown"],
      gender: json["gender"],
      address: json["address"],
      district: json["district"],
      deviceId: json["deviceId"],
      country: json["country"],
      kycScore: json["kycScore"],
      alertStatus: json["alertStatus"],
      marriage: json["marriage"],
      alertType: json["alertType"],
      refUserId: json["refUserId"],
      note: json["note"],
      linkedBank: json["linkedBank"],
      createDate: json["createDate"],
      updateDate: json["updateDate"],
      wallet: Wallet.fromMap(json["wallet"]),
      linkBank: json["linkBank"],
      lockDate: json["lockDate"],
      role: json["role"],
      roles: json["roles"],
      listRoles: json["listRoles"],
      birthDateDay: json["birthDateDay"],
      age: json["age"],
      fullAddress: json["fullAddress"],
      statusName: json["statusName"]);

  Map<String, dynamic> toMap() => {
        "status": status,
        "username": username,
        "email": email,
        "phone": phone,
        "photo": photo,
        "fullName": fullName,
        "city": city,
        "action": action,
        "type": type,
        "id": id,
        "lockCount": lockCount,
        "birthDate": birthDate,
        "phoneStatus": phoneStatus,
        "idNumber": idNumber,
        "idDate": idDate,
        "idPlace": idPlace,
        "homeTown": homeTown,
        "gender": gender,
        "address": address,
        "district": district,
        "deviceId": deviceId,
        "country": country,
        "kycScore": kycScore,
        "alertStatus": alertStatus,
        "marriage": marriage,
        "alertType": alertType,
        "refUserId": refUserId,
        "note": note,
        "linkedBank": linkedBank,
        "createDate": createDate,
        "updateDate": updateDate,
        "wallet": wallet,
        "linkBank": linkBank,
        "lockDate": lockDate,
        "role": role,
        "roles": roles,
        "listRoles": listRoles,
        "birthDateDay": birthDateDay,
        "age": age,
        "fullAddress": fullAddress,
        "statusName": statusName
      };
}
