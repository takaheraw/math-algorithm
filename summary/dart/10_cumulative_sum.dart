List<int> cumulativeSum(List<int> data) {
  List<int> accumulates = List.filled(data.length + 1, 0);
  for (int i = 1; i <= data.length; i++) {
    accumulates[i] = accumulates[i - 1] + data[i - 1];
  }
  return accumulates;
}

void printRangeSum(List<int> data, int start, int end) {
  List<int> accumulates = cumulativeSum(data);
  print("Sum from day $start to day $end is ${accumulates[end] - accumulates[start - 1]}");
}

void main() {
  List<int> visitors = [62, 65, 41, 13, 20, 11, 18, 44, 53, 12, 18, 17, 14, 10, 39];
  printRangeSum(visitors, 2, 4);
  printRangeSum(visitors, 4, 13);
}
