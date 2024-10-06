fn binary_search(arr: &List<Int>, target: Int) -> Int {
  let mut low = 0
  let mut high = arr.size() - 1

  while low <= high {
    let mid = (low + high) / 2

    if arr[mid] == target {
      return mid  // 値が見つかった場合、インデックスを返す
    } else if arr[mid] < target {
      low = mid + 1  // 探索範囲を右半分に絞る
    } else {
      high = mid - 1  // 探索範囲を左半分に絞る
    }
  }

  return -1  // 値が見つからなかった場合
}

fn main {
  let arr = [1, 3, 5, 7, 9, 11, 13, 15]
  let target = 7
  let result = binary_search(&arr, target)

  if result != -1 {
    println("Target found at index: ", result)
  } else {
    println("Target not found")
  }
}
