import 'dart:io';

Map<String, int> menuItems = {
  "Pizza Fries": 480,
  "Burger": 400,
  "Fries": 200,
  "Matka Fries": 630
};

void viewMenu() {
  print("Menu:");
  for (var item in menuItems.keys) {
    print("$item - RS:${menuItems[item]!}");
  }
}

int placeOrder(Map<String, int> orders) {
  int totalCost = 0;

  while (true) {
    viewMenu();

    print("Enter menu item name to order (e.g., Pizza Fries): ");
    String? inputItem = stdin.readLineSync();

    if (inputItem == null || !menuItems.containsKey(inputItem)) {
      print("Invalid item name. Please enter a valid menu item.");
      continue;
    }

    print("Enter quantity: ");
    String? inputQuantity = stdin.readLineSync();
    int? quantity = int.tryParse(inputQuantity ?? '');

    if (quantity == null || quantity <= 0) {
      print("Invalid quantity. Please enter a positive number.");
      continue;
    }

    int itemPrice = menuItems[inputItem]!;
    int cost = itemPrice * quantity;

    orders.update(
      inputItem,
      (existingQuantity) => existingQuantity + quantity,
      ifAbsent: () => quantity,
    );

    totalCost += cost;
    print(
        "Order placed successfully: $quantity x $inputItem at RS:${itemPrice} each");

    print("\nDo you want to add more items? (Y/N): ");
    String? continueOrdering = stdin.readLineSync();
    if (continueOrdering?.toUpperCase() != 'Y') {
      break;
    }
  }

  return totalCost;
}
