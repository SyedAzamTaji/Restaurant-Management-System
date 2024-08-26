import 'dart:io';
import 'place_order.dart';
import 'signup_login.dart';
import 'view_order.dart';

void main() {
  Map<String, int> orders = {};
  while (true) {
    print("\nWelcome to the Restaurant Management System");
    print("1. Signup & Login");
    print("2. Exit\n");
    int choice = int.parse(stdin.readLineSync()!);

    if (choice == 1) {
      signup();
      bool loginSuccess = login();
      if (loginSuccess) {
        viewMenu();
        print("\nWant to Place Order? \n=> Press Y or YES to order");
        String choice1 = stdin.readLineSync()!;
        if (choice1.toUpperCase() == "Y" || choice1.toUpperCase() == "YES") {
          int totalCost = placeOrder(orders);
          Order order1 = Order();
          order1.viewOrders(orders, totalCost);
        } else {
          print("Thank you for visiting!");
        }
      }
    } else if (choice == 2) {
      print("Exiting! THANK YOU");
      return;
    } else {
      print("Invalid choice! Please select 1 or 2.");
    }
  }
}
