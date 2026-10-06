void main() {
  int matchaOrders = 5;
  double matchaPrice = 180.0;
  String customerName = "Cryst";
  bool isAvailable = true;

  double total = matchaOrders * matchaPrice;
  bool isEnough = matchaOrders >= 5;

  print("Customer: $customerName");
  print("Number of orders: $matchaOrders");
  print("Price per matcha: ₱$matchaPrice");
  print("Matcha available: $isAvailable");
  print("Total price: ₱$total");
  print("Minimum order reached: $isEnough");
}