import '../User/user_model.dart';

class FisrtPassword {
  String? status;
  String? message;
  DataFirstPassword? data;

  FisrtPassword({
    this.status,
    this.message,
    this.data,
  });

  factory FisrtPassword.fromMap(Map<String, dynamic> json) => FisrtPassword(
        status: json["status"],
        message: json["message"],
        data: DataFirstPassword.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "mesage": message,
        "data": data,
      };
}

class DataFirstPassword {
  String? access_token;
  String? token_type;
  String? refresh_token;
  int? expires_in;
  String? scope;
  String? jti;
  User? user;

  DataFirstPassword(
      {this.access_token,
      this.token_type,
      this.refresh_token,
      this.expires_in,
      this.scope,
      this.jti,
      this.user});

  factory DataFirstPassword.fromMap(Map<String, dynamic> json) =>
      DataFirstPassword(
          access_token: json["access_token"],
          token_type: json["token_type"],
          refresh_token: json["refresh_token"],
          expires_in: json["expires_in"],
          scope: json["scope"],
          jti: json["jti"],
          user: User.fromMap(json["user"]));

  Map<String, dynamic> toMap() => {
        "access_token": access_token,
        "token_type": token_type,
        "refresh_token": refresh_token,
        "expires_in": expires_in,
        "scope": scope,
        "jti": jti,
        "user": user,
      };
}
