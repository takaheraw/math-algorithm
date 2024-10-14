fn bfs(graph: &List<List<Int>>, start: Int) -> List<Int> {
  let mut queue = List<Int>::new()  // 探索のためのキュー
  let mut visited = List<Bool>::new_with_size(graph.size(), false)  // 訪問済みフラグ
  let mut order = List<Int>::new()  // 探索順を記録

  // 初期設定
  queue.push(start)
  visited[start] = true

  // キューが空になるまで探索
  while !queue.is_empty() {
    let u = queue.remove(0)  // キューの先頭を取り出す
    order.push(u)

    // uの隣接頂点を全て調べる
    for &v in graph[u].iter() {
      if !visited[v] {
        queue.push(v)
        visited[v] = true
      }
    }
  }

  return order
}

fn main {
  // グラフの定義 (隣接リスト形式)
  let graph = [
    [1, 2],    // 頂点0から1と2へ
    [0, 3, 4], // 頂点1から0、3、4へ
    [0, 5],    // 頂点2から0と5へ
    [1],       // 頂点3から1へ
    [1],       // 頂点4から1へ
    [2]        // 頂点5から2へ
  ]

  let start = 0
  let traversal_order = bfs(&graph, start)

  // 結果の表示
  println("BFS traversal order starting from node ", start, ": ", traversal_order)
}
