import 'package:mc_dart/models/order/order.dart';

class OrderList {
  final List<Order>? orders;

  OrderList({
    this.orders,
  });

  factory OrderList.fromJson(List<dynamic> json) {
    List<Order> orders = <Order>[];
    orders = json.map((order) => Order.fromMap(order)).toList();

    return OrderList(
      orders: orders,
    );
  }
}
