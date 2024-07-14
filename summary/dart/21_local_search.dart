List<int> localSearchAlgorithm(List<int> arr, int Function(List<int>) costFunction) {
  int n = arr.length;
  List<int> bestSolution = List.from(arr);
  int bestCost = costFunction(bestSolution);

  bool improved;
  do {
    improved = false;
    for (int i = 0; i < n; i++) {
      for (int j = i + 1; j < n; j++) {
        List<int> currentSolution = List.from(bestSolution);
        int temp = currentSolution[i];
        currentSolution[i] = currentSolution[j];
        currentSolution[j] = temp;

        int currentCost = costFunction(currentSolution);
        if (currentCost < bestCost) {
          bestSolution = List.from(currentSolution);
          bestCost = currentCost;
          improved = true;
        }
      }
    }
  } while (improved);

  return bestSolution;
}

void main() {
  // Example usage:
  List<int> inputArray = [5, 3, 8, 6, 2];
  List<int> bestArray = localSearchAlgorithm(inputArray, (arr) => arr.fold(0, (sum, num) => sum + num * num));
  print("Optimized Array: $bestArray");
}
