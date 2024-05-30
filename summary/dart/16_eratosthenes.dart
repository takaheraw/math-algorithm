List<int> sieveOfEratosthenes(int max) {
  List<int> numbers = List<int>.generate(max - 1, (int index) => index + 2);
  List<int> primes = [];

  while (numbers.isNotEmpty) {
    int prime = numbers.removeAt(0);
    primes.add(prime);
    numbers.removeWhere((num) => num % prime == 0);
  }

  return primes;
}

// Example usage:
void main() {
  int maxNumber = 30;
  List<int> primes = sieveOfEratosthenes(maxNumber);
  print("Primes up to $maxNumber: ${primes.join(', ')}");
}
