import 'dart:io';

double calculateMatchaTotal(int orders, double price) {
  if (orders <= 0 || price <= 0) {
    throw FormatException("Orders and price must be greater than zero!");
  }

  double total = 0.0;

  print("Processing receipt breakdown:");
  for (int i = 1; i <= orders; i++) {
    if (i >= 5) {
      double discountedPrice =
          price - 20.0; // ₱20 discount on 5th order onwards
      total += discountedPrice;
      print("  Order #$i: Bulk Promo Applied! (₱$discountedPrice)");
    } else {
      total += price;
      print("  Order #$i: Standard Price (₱$price)");
    }
  }

  return total;
}

void main() {
  String customerName = "Cryst";
  int matchaOrders = 5;
  double matchaPrice = 180.0;

  print("========================================");
  print("    MATCHA MORI LOGIC ORDER SYSTEM     ");
  print("========================================");
  print("Customer: $customerName\n");

  try {
    print("[TEST 1: Normal Order Processing]");
    double finalTotal = calculateMatchaTotal(matchaOrders, matchaPrice);

    print("----------------------------------------");
    print("Total price: ₱${finalTotal.toStringAsFixed(2)}");
    print(
      "Average price per order: ₱${(finalTotal / matchaOrders).toStringAsFixed(2)}",
    );
  } catch (e) {
    print("An error occurred: $e");
  }

  print("\n========================================");

  try {
    print("[TEST 2: Bad Input Test]");
    print("Attempting to process -3 orders...");

    double invalidTotal = calculateMatchaTotal(-3, matchaPrice);
    print("Total: ₱$invalidTotal");
  } catch (e) {
    print("--> Gracefully Caught Error: $e");
    print("--> Program continued running safely without crashing!");
  }

  print("========================================");
}
