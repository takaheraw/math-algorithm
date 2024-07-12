import 'dart:io';

int knapsack(List<int> weights, List<int> values, int capacity) {
  int n = weights.length;
  List<List<int>> dp = List.generate(n + 1, (_) => List.filled(capacity + 1, 0));

  for (int i = 1; i <= n; i++) {
    for (int w = 1; w <= capacity; w++) {
      if (weights[i - 1] <= w) {
        dp[i][w] = dp[i - 1][w].clamp(dp[i - 1][w], values[i - 1] + dp[i - 1][w - weights[i - 1]]);
      } else {
        dp[i][w] = dp[i - 1][w];
      }
    }
  }

  return dp[n][capacity];
}

void main() {
  print("Enter the weights separated by space:");
  String? inputWeights = stdin.readLineSync();
  if (inputWeights != null) {
    List<int> weights = inputWeights.split(' ').map(int.parse).toList();
    print("Enter the values separated by space:");
    String? inputValues = stdin.readLineSync();
    if (inputValues != null) {
      List<int> values = inputValues.split(' ').map(int.parse).toList();
      print("Enter the capacity:");
      String? inputCapacity = stdin.readLineSync();
      if (inputCapacity != null) {
        int capacity = int.parse(inputCapacity);
        int maxValue = knapsack(weights, values, capacity);
        print("Maximum value that can be accommodated: $maxValue");
      }
    }
  }
}
