class Roles {
  int? id;
  String? name;
  String? type;
  String? access;

  Roles({this.name, this.access, this.id, this.type});

  factory Roles.fromMap(Map<String, dynamic> json) => Roles(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        access: json["access"],
      );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "access": access,
    "type": type
  };
}
