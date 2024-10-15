fn activity_selection(start_times: &List<Int>, end_times: &List<Int>) -> List<Int> {
  let n = start_times.size()
  let mut selected_activities = List<Int>::new()

  // 最初の活動を選択
  let mut last_end_time = end_times[0]
  selected_activities.push(0)

  for i in 1..n {
    if start_times[i] >= last_end_time {
      selected_activities.push(i)
      last_end_time = end_times[i]
    }
  }

  return selected_activities
}

fn main {
  let start_times = [1, 3, 0, 5, 8, 5]
  let end_times = [2, 4, 6, 7, 9, 9]

  let result = activity_selection(&start_times, &end_times)

  // 結果を表示
  println("Selected activities are: ", result)
}
