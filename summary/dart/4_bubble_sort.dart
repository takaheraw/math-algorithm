List<int> bubbleSort(List<int> list) {
  int n = list.length;
  int i, step;
  for (step = 0; step < n; step++) {
    for (i = 0; i < n - step - 1; i++) {
      if (list[i] > list[i + 1]) {
        // Swap elements if they are in wrong order
        int temp = list[i];
        list[i] = list[i + 1];
        list[i + 1] = temp;
      }
    }
  }
  return list;
}

void main() {
  List<int> unsortedList = [5, 3, 8, 4, 2, 1, 6, 7];
  List<int> sortedList = bubbleSort(unsortedList);
  print(sortedList);
}
