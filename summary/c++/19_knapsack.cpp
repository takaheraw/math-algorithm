#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

// ナップザック問題を解く関数
int knapsack(int W, vector<int>& weights, vector<int>& values, int n) {
    vector<vector<int> > dp(n + 1, vector<int>(W + 1, 0));

    // 動的計画法のテーブルを埋める
    for (int i = 1; i <= n; ++i) {
        for (int w = 0; w <= W; ++w) {
            if (weights[i - 1] <= w) {
                dp[i][w] = max(dp[i - 1][w], dp[i - 1][w - weights[i - 1]] + values[i - 1]);
            } else {
                dp[i][w] = dp[i - 1][w];
            }
        }
    }

    // 最大の価値を返す
    return dp[n][W];
}

int main() {
    int W = 50; // ナップザックの最大重量
    int weightsArray[] = {10, 20, 30}; // 各アイテムの重量
    int valuesArray[] = {60, 100, 120}; // 各アイテムの価値

    vector<int> weights(weightsArray, weightsArray + sizeof(weightsArray) / sizeof(int));
    vector<int> values(valuesArray, valuesArray + sizeof(valuesArray) / sizeof(int));
    int n = weights.size(); // アイテムの数

    cout << "最大の価値: " << knapsack(W, weights, values, n) << endl;

    return 0;
}
