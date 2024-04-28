int fibonacci(int n) {
  List<int> fibs = List.filled(n + 1, 0);
  if (n == 0) return 0;
  fibs[1] = 1;
  for (int i = 2; i <= n; i++) {
    fibs[i] = fibs[i - 1] + fibs[i - 2];
  }
  return fibs[n];
}

void main() {
  print("Fibonacci of 10 is ${fibonacci(10)}");
}
