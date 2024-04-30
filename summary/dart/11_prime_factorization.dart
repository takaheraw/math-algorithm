import 'dart:io';

List<int> primeFactors(int n) {
  List<int> factors = [];
  int divisor = 2;

  while (n > 1) {
    while (n % divisor == 0) {
      factors.add(divisor);
      n ~/= divisor;
    }
    divisor += 1;
  }

  return factors;
}

void main() {
  print("Enter a number:");
  String? input = stdin.readLineSync();
  if (input != null) {
    int number = int.parse(input);
    List<int> factors = primeFactors(number);
    print("Prime factors: $factors");
  }
}
