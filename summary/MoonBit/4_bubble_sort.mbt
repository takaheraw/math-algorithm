fn bubble_sort(arr: &mut List<Int>) {
  let n = arr.size()
  let mut swapped: Bool

  for i = 0; i < n - 1; i = i + 1 {
    swapped = false
    for j = 0; j < n - i - 1; j = j + 1 {
      if arr[j] > arr[j + 1] {
        // スワップ
        let temp = arr[j]
        arr[j] = arr[j + 1]
        arr[j + 1] = temp
        swapped = true
      }
    }

    // もし交換がなければ終了
    if !swapped {
      break
    }
  }
}

fn main {
  let mut arr = [64, 34, 25, 12, 22, 11, 90]
  bubble_sort(&mut arr)
  println(arr)  // 出力: [11, 12, 22, 25, 34, 64, 90]
}
