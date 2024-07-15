import 'dart:math';

List<int> simulatedAnnealing(List<int> initialSolution, int Function(List<int>) costFunction) {
  List<int> currentSolution = List.from(initialSolution);
  int currentCost = costFunction(currentSolution);
  double temperature = 100.0;
  double minTemperature = 0.01;
  double alpha = 0.9;
  Random random = Random();

  while (temperature > minTemperature) {
    List<int> nextSolution = List.from(currentSolution);
    int i = random.nextInt(currentSolution.length);
    int j = random.nextInt(currentSolution.length);
    int temp = nextSolution[i];
    nextSolution[i] = nextSolution[j];
    nextSolution[j] = temp;
    int nextCost = costFunction(nextSolution);

    if (nextCost < currentCost || exp((currentCost - nextCost) / temperature) > random.nextDouble()) {
      currentSolution = List.from(nextSolution);
      currentCost = nextCost;
    }

    temperature *= alpha;
  }

  return currentSolution;
}

void main() {
  // Example usage:
  List<int> inputArray = [5, 3, 8, 6, 2];
  List<int> optimizedArray = simulatedAnnealing(inputArray, (arr) => arr.fold(0, (sum, num) => sum + num * num));
  print("Optimized Array using Simulated Annealing: $optimizedArray");
}
