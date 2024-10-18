fn sliding_window(arr: &List<Int>, k: Int) -> Int {
  let mut left = 0
  let mut sum = 0
  let mut max_len = 0

  for right in 0..arr.size() {
    sum = sum + arr[right]

    // 区間の和がKを超えたら、左端を動かして調整
    while sum > k {
      sum = sum - arr[left]
      left = left + 1
    }

    // 現在の区間の長さを更新
    max_len = max_len.max(right - left + 1)
  }

  return max_len
}

fn main {
  let arr = [2, 1, 3, 2, 4, 3]
  let k = 7
  let result = sliding_window(&arr, k)
  println("Maximum length of subarray with sum <= ", k, ": ", result)
}
