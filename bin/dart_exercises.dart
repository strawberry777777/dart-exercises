void main() {
  int matchaOrders = 5;
  double matchaPrice = 180.0;
  String customerName = "Cryst";
  bool isAvailable = true;

  double total = matchaOrders * matchaPrice;
  double averagePrice = total / matchaOrders;
  bool isEnough = matchaOrders >= 5;
  int remainingOrders = 10 - matchaOrders;

  print("Customer: $customerName");
  print("Number of orders: $matchaOrders");
  print("Price per matcha: ₱$matchaPrice");
  print("Matcha available: $isAvailable");
  print("Total price: ₱$total");
  print("Average price per order: ₱$averagePrice");
  print("Minimum order reached: $isEnough");
  print("Orders remaining to reach 10: $remainingOrders");
}