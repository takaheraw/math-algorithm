use random

fn objective_function(x: Float) -> Float {
  // シンプルな目的関数の例
  return -(x - 3.0) * (x - 3.0) + 10.0
}

fn simulated_annealing(start: Float, initial_temp: Float, cooling_rate: Float, max_iters: Int) -> Float {
  let mut current_solution = start
  let mut current_value = objective_function(current_solution)
  let mut temp = initial_temp

  let mut best_solution = current_solution
  let mut best_value = current_value

  for _ in 0..max_iters {
    // 温度が低くなるにつれて探索範囲を狭める
    let new_solution = current_solution + (random::random() * 2.0 - 1.0) * temp
    let new_value = objective_function(new_solution)

    // 良い解なら無条件で採用、悪い解でも確率的に採用
    if new_value > current_value || random::random() < ((new_value - current_value) / temp).exp() {
      current_solution = new_solution
      current_value = new_value

      // ベストソリューションを更新
      if new_value > best_value {
        best_solution = new_solution
        best_value = new_value
      }
    }

    // 温度を下げる
    temp = temp * cooling_rate
  }

  return best_solution
}

fn main {
  let start = 0.0
  let initial_temp = 100.0
  let cooling_rate = 0.99
  let max_iters = 1000

  let result = simulated_annealing(start, initial_temp, cooling_rate, max_iters)
  println("Best solution found: ", result)
}
