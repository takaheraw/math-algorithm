fn objective_function(x: Int) -> Int {
  // シンプルな目的関数の例（ここではxの二次関数）
  return -(x - 3) * (x - 3) + 10
}

fn hill_climbing(start: Int, max_iters: Int) -> Int {
  let mut current_solution = start
  let mut current_value = objective_function(current_solution)

  for _ in 0..max_iters {
    let mut neighbor_solution = current_solution + 1
    let neighbor_value = objective_function(neighbor_solution)

    if neighbor_value > current_value {
      // 隣接する解が現在の解よりも良ければ、その解に移動
      current_solution = neighbor_solution
      current_value = neighbor_value
    } else {
      // 近傍に改善が見つからない場合、終了
      break
    }
  }

  return current_solution
}

fn main() {
  let start = 0
  let max_iters = 100
  let result = hill_climbing(start, max_iters)
  println("Best solution found: ", result)
}
