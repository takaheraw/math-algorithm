#include <iostream>
#include <vector>
#include <algorithm>
#include <cstdlib>
#include <ctime>

using namespace std;

int local_search(vector<int>& weights, vector<int>& values, int capacity) {
    int n = weights.size();
    vector<int> current_solution(n, 0);
    int current_value = 0;
    int current_weight = 0;

    // Initial solution: add items until capacity is reached
    for (int i = 0; i < n; ++i) {
        if (current_weight + weights[i] <= capacity) {
            current_solution[i] = 1;
            current_value += values[i];
            current_weight += weights[i];
        }
    }

    bool improved = true;
    while (improved) {
        improved = false;
        for (int i = 0; i < n; ++i) {
            if (current_solution[i] == 1) {
                // Try removing item i
                current_solution[i] = 0;
                current_value -= values[i];
                current_weight -= weights[i];

                for (int j = 0; j < n; ++j) {
                    if (current_solution[j] == 0 && current_weight + weights[j] <= capacity) {
                        // Try adding item j
                        current_solution[j] = 1;
                        current_value += values[j];
                        current_weight += weights[j];

                        improved = true;
                        break;
                    }
                }

                if (improved) {
                    break;
                } else {
                    // Revert changes
                    current_solution[i] = 1;
                    current_value += values[i];
                    current_weight += weights[i];
                }
            }
        }
    }

    return current_value;
}

int main() {
    int capacity = 50; // ナップザックの最大重量
    int weightsArray[] = {10, 20, 30}; // 各アイテムの重量
    int valuesArray[] = {60, 100, 120}; // 各アイテムの価値

    vector<int> weights(weightsArray, weightsArray + sizeof(weightsArray) / sizeof(int));
    vector<int> values(valuesArray, valuesArray + sizeof(valuesArray) / sizeof(int));

    cout << "最大の価値: " << local_search(weights, values, capacity) << endl;

    return 0;
}
