int gcd(int a, int b) {
  while (b != 0) {
    int temp = b;
    b = a % b;
    a = temp;
  }
  return a;
}

void main() {
  print(gcd(48, 18)); // 6
  print(gcd(100, 25)); // 25
  print(gcd(7, 3)); // 1
}
