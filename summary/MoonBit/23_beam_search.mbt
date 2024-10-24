use priority_queue

fn beam_search(start: Int, goal: Int, beam_width: Int) -> List<Int> {
  // 探索用キュー（優先度付き）
  let mut queue = PriorityQueue<(Int, List<Int>), Int>()  // (現在の状態、経路)のペア

  // スタート状態をキューに追加
  queue.push((start, [start]), 0)

  while !queue.is_empty() {
    let mut new_queue = PriorityQueue<(Int, List<Int>), Int>()

    // 現在のキュー内のビーム幅以内の状態を展開
    for _ in 0..beam_width {
      if queue.is_empty() {
        break
      }

      let (current_state, path) = queue.pop()

      // ゴールに到達した場合
      if current_state == goal {
        return path
      }

      // 現在の状態からの遷移を生成し、キューに追加
      let neighbors = get_neighbors(current_state)
      for neighbor in neighbors.iter() {
        let mut new_path = path.clone()
        new_path.push(*neighbor)
        new_queue.push((*neighbor, new_path), heuristic(*neighbor, goal))
      }
    }

    // 新しいキューに置き換え
    queue = new_queue
  }

  // 解が見つからなかった場合
  return []
}

// 近傍ノードを取得するダミー関数（適切に実装する必要がある）
fn get_neighbors(state: Int) -> List<Int> {
  // ここでは単純にstate + 1, state + 2を近傍とする
  return [state + 1, state + 2]
}

// ヒューリスティック関数
fn heuristic(state: Int, goal: Int) -> Int {
  return (goal - state).abs()  // ゴールとの距離
}

fn main {
  let start = 0
  let goal = 10
  let beam_width = 2  // ビーム幅
  let result = beam_search(start, goal, beam_width)

  if !result.is_empty() {
    println("Path found: ", result)
  } else {
    println("No path found")
  }
}
