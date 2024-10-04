fn quick_sort(arr: &mut List<Int>, low: Int, high: Int) {
  if low < high {
    let pi = partition(arr, low, high)

    // ピボットの左部分と右部分を再帰的にソート
    quick_sort(arr, low, pi - 1)
    quick_sort(arr, pi + 1, high)
  }
}

fn partition(arr: &mut List<Int>, low: Int, high: Int) -> Int {
  let pivot = arr[high]
  let mut i = low - 1

  for j = low; j < high; j = j + 1 {
    if arr[j] < pivot {
      i = i + 1
      // スワップ
      let temp = arr[i]
      arr[i] = arr[j]
      arr[j] = temp
    }
  }
  // ピボットとi+1番目の要素をスワップ
  let temp = arr[i + 1]
  arr[i + 1] = arr[high]
  arr[high] = temp

  return i + 1
}

fn main {
  let mut arr = [10, 7, 8, 9, 1, 5]
  quick_sort(&mut arr, 0, arr.size() - 1)
  println(arr)  // 出力: [1, 5, 7, 8, 9, 10]
}
