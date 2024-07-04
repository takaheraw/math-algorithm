#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

int bit_dp(int capacity, vector<int>& weights, vector<int>& values) {
    int n = weights.size();
    vector<int> dp(1 << n, 0);

    for (int s = 1; s < (1 << n); ++s) {
        for (int i = 0; i < n; ++i) {
            if (s & (1 << i)) {
                int prev_subset = s ^ (1 << i);
                if (weights[i] <= capacity) {
                    dp[s] = max(dp[s], dp[prev_subset] + values[i]);
                }
            }
        }
    }

    return dp[(1 << n) - 1];
}

int main() {
    int capacity = 50; // ナップザックの最大重量
    int weightsArray[] = {10, 20, 30}; // 各アイテムの重量
    int valuesArray[] = {60, 100, 120}; // 各アイテムの価値

    vector<int> weights(weightsArray, weightsArray + sizeof(weightsArray) / sizeof(int));
    vector<int> values(valuesArray, valuesArray + sizeof(valuesArray) / sizeof(int));

    cout << "最大の価値: " << bit_dp(capacity, weights, values) << endl;

    return 0;
}
