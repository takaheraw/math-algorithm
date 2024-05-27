import 'dart:collection';

List<String> breadthFirstSearch(Map<String, List<String>> graph, String startVertex) {
  Queue<String> queue = Queue<String>();
  queue.add(startVertex);
  List<String> orderOfVisit = [];
  Map<String, bool> visited = {startVertex: true};

  while (queue.isNotEmpty) {
    String currentVertex = queue.removeFirst();
    orderOfVisit.add(currentVertex);

    for (String neighbor in graph[currentVertex]!) {
      if (!visited.containsKey(neighbor)) {
        queue.add(neighbor);
        visited[neighbor] = true;
      }
    }
  }

  return orderOfVisit;
}

void main() {
  Map<String, List<String>> graph = {
    'A': ['B', 'C'],
    'B': ['A', 'D', 'E'],
    'C': ['A', 'F'],
    'D': ['B'],
    'E': ['B', 'F'],
    'F': ['C', 'E']
  };

  List<String> result = breadthFirstSearch(graph, 'A');
  print('Order of visit: $result');
}
