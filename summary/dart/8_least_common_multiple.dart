int lcm(int a, int b) {
  if (a == 0 || b == 0) return 0;
  return (a * b).abs() ~/ gcd(a, b);
}

int gcd(int a, int b) {
  while (b != 0) {
    int temp = b;
    b = a % b;
    a = temp;
  }
  return a;
}

void main() {
  print(lcm(12, 18)); // 36
  print(lcm(5, 7)); // 35
}
