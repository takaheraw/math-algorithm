fn dijkstra(graph: &List<List<(Int, Int)>>, start: Int) -> List<Int> {
  let n = graph.size()
  let mut dist = List<Int>::new_with_size(n, Int::max_value())  // 無限大の初期値
  let mut visited = List<Bool>::new_with_size(n, false)  // 訪問済みフラグ
  dist[start] = 0  // 開始点の距離は0

  for _ in 0..n {
    let mut u = -1

    // 最短距離がまだ確定していない最小の頂点を探す
    for i in 0..n {
      if !visited[i] && (u == -1 || dist[i] < dist[u]) {
        u = i
      }
    }

    if dist[u] == Int::max_value() {
      break  // 残りの頂点は到達不能
    }

    visited[u] = true

    // uに隣接する頂点の距離を更新
    for &(v, weight) in graph[u].iter() {
      if dist[u] + weight < dist[v] {
        dist[v] = dist[u] + weight
      }
    }
  }

  return dist
}

fn main {
  // グラフの定義 (隣接リスト形式)
  let graph = [
    [(1, 2), (2, 4)],  // 頂点0から1への距離2、2への距離4
    [(2, 1), (3, 7)],  // 頂点1から2への距離1、3への距離7
    [(3, 3)],          // 頂点2から3への距離3
    []                 // 頂点3には隣接頂点なし
  ]

  let start = 0
  let distances = dijkstra(&graph, start)

  // 結果の表示
  println("Distances from start node ", start, ": ", distances)
}
