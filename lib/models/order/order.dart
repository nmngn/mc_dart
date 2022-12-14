class Order {
  int? userId;
  int? id;
  String? title;
  String? body;

  Order({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory Order.fromMap(Map<String, dynamic> json) => Order(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
  
}