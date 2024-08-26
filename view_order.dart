import 'place_order.dart';

class Order {
  void viewOrders(Map<String, int> orders, int totalCost) {
    if (orders.isEmpty) {
      print("No orders placed yet.");
    } else {
      print("Current Orders:");
      orders.forEach((item, quantity) {
        print("Ordered $quantity x $item at RS:${menuItems[item]!} each");
      });
      print("Total Cost: RS:${totalCost}");
    }
  }
}
