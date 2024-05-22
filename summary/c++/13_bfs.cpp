#include <iostream>
#include <vector>
#include <queue>
#include <unordered_map>

void breadth_first_search(const std::vector<std::vector<int>>& graph, int start_vertex) {
    std::queue<int> queue;
    std::vector<bool> visited(graph.size(), false);
    std::vector<int> order_of_visit;

    queue.push(start_vertex);
    visited[start_vertex] = true;

    while (!queue.empty()) {
        int current_vertex = queue.front();
        queue.pop();
        order_of_visit.push_back(current_vertex);

        for (int neighbor : graph[current_vertex]) {
            if (!visited[neighbor]) {
                queue.push(neighbor);
                visited[neighbor] = true;
            }
        }
    }

    // Output the order of visit for demonstration
    std::cout << "Order of visit: ";
    for (int vertex : order_of_visit) {
        std::cout << char('A' + vertex) << " ";
    }
    std::cout << std::endl;
}

int main() {
    // Example usage:
    // Graph representation using adjacency list
    // A -> B, A -> C
    // B -> A, B -> D, B -> E
    // C -> A, C -> F
    // D -> B
    // E -> B, E -> F
    // F -> C, F -> E
    std::vector<std::vector<int>> graph = {
        {1, 2},    // A -> B, C
        {0, 3, 4}, // B -> A, D, E
        {0, 5},    // C -> A, F
        {1},       // D -> B
        {1, 5},    // E -> B, F
        {2, 4}     // F -> C, E
    };

    breadth_first_search(graph, 0); // Start BFS from vertex A (index 0)
    return 0;
}
