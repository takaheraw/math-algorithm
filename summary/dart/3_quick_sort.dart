List<int> quickSort(List<int> arr) {
  if (arr.length <= 1) {
    return arr;
  }

  final pivot = arr[arr.length ~/ 2];
  final less = arr.where((v) => v < pivot).toList();
  final equal = arr.where((v) => v == pivot).toList();
  final greater = arr.where((v) => v > pivot).toList();

  return quickSort(less) + equal + quickSort(greater);
}

void main() {
  final arr = '10 7 8 9 1 5'.split(' ').map(int.parse).toList();
  final sortedArr = quickSort(arr);

  print(sortedArr);
}
