#include <iostream>
#include <vector>
#include <queue>
#include <limits>

using namespace std;

const int INF = numeric_limits<int>::max();

void dijkstra(const vector<vector<pair<int, int>>>& graph, int source, vector<int>& distances) {
    int n = graph.size();
    distances.assign(n, INF);
    distances[source] = 0;
    priority_queue<pair<int, int>, vector<pair<int, int>>, greater<pair<int, int>>> pq;
    pq.push({0, source});

    while (!pq.empty()) {
        int current_distance = pq.top().first;
        int current_vertex = pq.top().second;
        pq.pop();

        if (current_distance > distances[current_vertex]) {
            continue;
        }

        for (auto& edge : graph[current_vertex]) {
            int neighbor = edge.first;
            int weight = edge.second;
            int new_distance = current_distance + weight;

            if (new_distance < distances[neighbor]) {
                distances[neighbor] = new_distance;
                pq.push({new_distance, neighbor});
            }
        }
    }
}

int main() {
    int n = 4; // Number of vertices
    vector<vector<pair<int, int>>> graph(n);
    // Creating the graph:
    // A -> B (1), A -> C (4)
    graph[0].push_back({1, 1});
    graph[0].push_back({2, 4});
    // B -> A (1), B -> C (2), B -> D (5)
    graph[1].push_back({0, 1});
    graph[1].push_back({2, 2});
    graph[1].push_back({3, 5});
    // C -> A (4), C -> B (2), C -> D (1)
    graph[2].push_back({0, 4});
    graph[2].push_back({1, 2});
    graph[2].push_back({3, 1});
    // D -> B (5), D -> C (1)
    graph[3].push_back({1, 5});
    graph[3].push_back({2, 1});

    vector<int> distances;
    dijkstra(graph, 0, distances);

    for (int i = 0; i < n; i++) {
        cout << "Shortest distance from A to " << char('A' + i) << ": " << distances[i] << endl;
    }

    return 0;
}
