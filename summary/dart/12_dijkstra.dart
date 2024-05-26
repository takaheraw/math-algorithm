import 'dart:collection';

Map<String, double> dijkstra(Map<String, Map<String, double>> graph, String source) {
  Map<String, double> distances = {};
  for (var node in graph.keys) {
    distances[node] = double.infinity;
  }
  distances[source] = 0;

  List<String> priorityQueue = [source];

  while (priorityQueue.isNotEmpty) {
    priorityQueue.sort((a, b) => distances[a]!.compareTo(distances[b]!));
    String currentVertex = priorityQueue.removeAt(0);

    for (var neighbor in graph[currentVertex]!.keys) {
      double weight = graph[currentVertex]![neighbor]!;
      double newDistance = distances[currentVertex]! + weight;
      if (newDistance < distances[neighbor]!) {
        distances[neighbor] = newDistance;
        priorityQueue.add(neighbor);
      }
    }
  }

  return distances;
}

void main() {
  Map<String, Map<String, double>> graph = {
    'A': {'B': 1, 'C': 4},
    'B': {'A': 1, 'C': 2, 'D': 5},
    'C': {'A': 4, 'B': 2, 'D': 1},
    'D': {'B': 5, 'C': 1}
  };

  Map<String, double> result = dijkstra(graph, 'A');
  result.forEach((key, value) {
    print('Distance from A to $key is $value');
  });
}
