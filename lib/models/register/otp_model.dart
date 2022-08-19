class ConfirmOTP {
  String? status;
  String? message;
  DataConfirmOTP? data;

  ConfirmOTP({
    this.status,
    this.message,
    this.data,
  });

  factory ConfirmOTP.fromMap(Map<String, dynamic> json) => ConfirmOTP(
        status: json["status"],
        message: json["message"],
        data: DataConfirmOTP.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "mesage": message,
        "data": data,
      };
}

class DataConfirmOTP {
  String? id;
  String? verifyCode;
  String? verifyKey;
  String? userName;
  String? fullName;
  String? email;
  String? phone;
  String? action;
  int? userId;
  int? otpCount;
  int? lockCount;
  String? deviceId;
  String? expireDate;
  int? loginCount;

  DataConfirmOTP(
      {this.id,
      this.verifyCode,
      this.verifyKey,
      this.userName,
      this.fullName,
      this.email,
      this.phone,
      this.action,
      this.userId,
      this.otpCount,
      this.lockCount,
      this.deviceId,
      this.expireDate,
      this.loginCount});

  factory DataConfirmOTP.fromMap(Map<String, dynamic> json) => DataConfirmOTP(
        id: json["id"],
        verifyCode: json["verifyCode"],
        verifyKey: json["verifyKey"],
        userName: json["userName"],
        fullName: json["fullName"],
        email: json["email"],
        phone: json["phone"],
        action: json["action"],
        userId: json["userId"],
        otpCount: json["otpCount"],
        lockCount: json["lockCount"],
        deviceId: json["deviceId"],
        expireDate: json["expireDate"],
        loginCount: json["loginCount"]
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "verifyCode": verifyCode,
        "verifyKey": verifyKey,
        "userName": userName,
        "fullName": fullName,
        "email": email,
        "phone": phone,
        "action": action,
        "userId": userId,
        "otpCount": otpCount,
        "lockCount": lockCount,
        "deviceId": deviceId,
        "expireDate": expireDate,
        "loginCount": loginCount
      };
}
