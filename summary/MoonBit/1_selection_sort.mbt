fn selection_sort(arr : &mut List<Int>) {
  for i = 0; i < arr.size(); i = i + 1 {
    let mut min_index = i
    for j = i + 1; j < arr.size(); j = j + 1 {
      if arr[j] < arr[min_index] {
        min_index = j
      }
    }
    if min_index != i {
      // スワップ
      let temp = arr[i]
      arr[i] = arr[min_index]
      arr[min_index] = temp
    }
  }
}

fn main {
  let mut arr = [64, 25, 12, 22, 11]
  selection_sort(&mut arr)
  println(arr)  // 出力: [11, 12, 22, 25, 64]
}
