import 'dart:math';

double calculateTotal(List<double> prices, {double taxRate = 0.0}) {
  double total = 0;
  for (double price in prices) {
    total += price;
  }
  return total * (1 + taxRate);
}

List<double> filterItems(List<double> prices, double threshold) {
  return prices.where((price) => price >= threshold).toList();
}

List<double> applyDiscount(List<double> prices, double discountPercentage) {
  return prices.map((price) => price * (1 - discountPercentage / 100)).toList();
}

double calculateFactorialDiscount(int n) {
  if (n == 0) {
    return 1;
  } else {
    return n * calculateFactorialDiscount(n - 1);
  }
}

void main() {
  List<double> itemPrices = [10.99, 5.99, 29.99, 15.99];

  // Filter out items under $10
  List<double> filteredPrices = filterItems(itemPrices, 10);

  // Apply a 10% discount to all items
  List<double> discountedPrices = applyDiscount(filteredPrices, 10);

  // Calculate the total price with 5% tax
  double totalPrice = calculateTotal(discountedPrices, taxRate: 0.05);

  // Calculate the factorial discount based on the number of items
  int itemCount = discountedPrices.length;
  double factorialDiscount = calculateFactorialDiscount(itemCount) / 100;

  // Apply the factorial discount to the total price
  double finalPrice = totalPrice * (1 - factorialDiscount);

  print("Final price after discounts and tax: \$${finalPrice.toStringAsFixed(2)}");
}