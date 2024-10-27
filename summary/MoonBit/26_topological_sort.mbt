fn topological_sort(graph: &List<List<Int>>) -> List<Int> {
  let n = graph.size()
  let mut in_degree = List<Int>::new_with_size(n, 0)
  let mut result = List<Int>::new()
  let mut queue = List<Int>::new()

  // 入次数を計算
  for u in 0..n {
    for &v in graph[u].iter() {
      in_degree[v] = in_degree[v] + 1
    }
  }

  // 入次数が0の頂点をキューに追加
  for i in 0..n {
    if in_degree[i] == 0 {
      queue.push(i)
    }
  }

  // キューが空になるまで探索
  while !queue.is_empty() {
    let node = queue.remove(0)
    result.push(node)

    // 隣接頂点の入次数を減らす
    for &neighbor in graph[node].iter() {
      in_degree[neighbor] = in_degree[neighbor] - 1
      if in_degree[neighbor] == 0 {
        queue.push(neighbor)
      }
    }
  }

  // トポロジカルソートが完了したか確認（閉路がないか）
  if result.size() != n {
    println("The graph has a cycle.")
    return []
  }

  return result
}

fn main {
  // 有向グラフの定義（隣接リスト形式）
  let graph = [
    [1, 2],    // 頂点0から1と2へ
    [3],       // 頂点1から3へ
    [3],       // 頂点2から3へ
    []         // 頂点3は出発先なし
  ]

  let result = topological_sort(&graph)

  if !result.is_empty() {
    println("Topological Sort: ", result)
  } else {
    println("No valid topological order exists (graph contains a cycle).")
  }
}
