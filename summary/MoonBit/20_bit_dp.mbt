fn tsp(graph: &List<List<Int>>, n: Int) -> Int {
  // dp[mask][i] は訪問済みの都市集合がmaskで、現在の都市がiのときの最小コスト
  let mut dp = List<List<Int>>::new_with_size(1 << n, List::new_with_size(n, Int::max_value()))

  // 初期条件: 最初の都市にいるときのコストは0
  dp[1][0] = 0

  // 全ての部分集合をビットマスクで表現
  for mask in 0..(1 << n) {
    for u in 0..n {
      if (mask & (1 << u)) == 0 {
        continue  // 都市uがmaskに含まれていないならスキップ
      }

      // 次の都市vへの遷移
      for v in 0..n {
        if (mask & (1 << v)) == 0 {
          dp[mask | (1 << v)][v] = dp[mask | (1 << v)][v].min(dp[mask][u] + graph[u][v])
        }
      }
    }
  }

  // 全ての都市を訪問し、スタート地点(0)に戻る
  let mut res = Int::max_value()
  for i in 1..n {
    res = res.min(dp[(1 << n) - 1][i] + graph[i][0])
  }

  return res
}

fn main {
  let graph = [
    [0, 10, 15, 20],
    [10, 0, 35, 25],
    [15, 35, 0, 30],
    [20, 25, 30, 0]
  ]

  let n = 4
  let result = tsp(&graph, n)
  println("The minimum cost is: ", result)
}
