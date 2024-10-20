fn knapsack(weights: &List<Int>, values: &List<Int>, capacity: Int) -> Int {
  let n = weights.size()
  
  // DPテーブルの初期化
  let mut dp = List<List<Int>>::new_with_size(n + 1, List::new_with_size(capacity + 1, 0))

  // 動的計画法によるテーブルの更新
  for i = 1; i <= n; i = i + 1 {
    for w = 0; w <= capacity; w = w + 1 {
      if weights[i - 1] <= w {
        // i番目のアイテムを選ぶ場合と選ばない場合の最大値を選択
        dp[i][w] = dp[i - 1][w].max(dp[i - 1][w - weights[i - 1]] + values[i - 1])
      } else {
        dp[i][w] = dp[i - 1][w]
      }
    }
  }

  // 最大価値を返す
  return dp[n][capacity]
}

fn main {
  let weights = [1, 3, 4, 5]    // アイテムの重さ
  let values = [10, 40, 50, 70] // アイテムの価値
  let capacity = 8              // ナップサックの容量

  let result = knapsack(&weights, &values, capacity)
  println("Maximum value that can be obtained: ", result)
}
