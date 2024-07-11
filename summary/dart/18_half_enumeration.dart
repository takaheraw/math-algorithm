import 'dart:io';

int halfEnumeration(List<int> arr, int targetSum) {
  int n = arr.length;
  int half = n ~/ 2;

  Map<int, int> firstHalfSubsets = {};
  for (int i = 0; i < (1 << half); i++) {
    int sum = 0;
    for (int j = 0; j < half; j++) {
      if ((i & (1 << j)) != 0) {
        sum += arr[j];
      }
    }
    firstHalfSubsets[sum] = (firstHalfSubsets[sum] ?? 0) + 1;
  }

  Map<int, int> secondHalfSubsets = {};
  for (int i = 0; i < (1 << (n - half)); i++) {
    int sum = 0;
    for (int j = 0; j < (n - half); j++) {
      if ((i & (1 << j)) != 0) {
        sum += arr[half + j];
      }
    }
    secondHalfSubsets[sum] = (secondHalfSubsets[sum] ?? 0) + 1;
  }

  int count = 0;
  firstHalfSubsets.forEach((sum1, count1) {
    int needed = targetSum - sum1;
    count += count1 * (secondHalfSubsets[needed] ?? 0);
  });

  return count;
}

void main() {
  print("Enter the array elements separated by space:");
  String? inputArray = stdin.readLineSync();
  if (inputArray != null) {
    List<int> arr = inputArray.split(' ').map(int.parse).toList();
    print("Enter the target sum:");
    String? inputTarget = stdin.readLineSync();
    if (inputTarget != null) {
      int targetSum = int.parse(inputTarget);
      int result = halfEnumeration(arr, targetSum);
      print("Number of ways to achieve sum $targetSum: $result");
    }
  }
}
