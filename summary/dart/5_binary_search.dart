int binarySearch(List<int> sortedList, int target) {
  int low = 0;
  int high = sortedList.length - 1;

  while (low <= high) {
    int mid = low + (high - low) ~/ 2;
    int midValue = sortedList[mid];

    if (midValue == target) {
      return mid;
    } else if (midValue < target) {
      low = mid + 1;
    } else {
      high = mid - 1; 
    }
  }

  return -1; // Target not found
}

void main() {
  List<int> sortedList = [1, 2, 3, 4, 5, 6, 7, 8];
  int target = 5;
  int result = binarySearch(sortedList, target);
  if (result != -1) {
    print("Element found at index: $result");
  } else {
    print("Element not found");
  }
}
