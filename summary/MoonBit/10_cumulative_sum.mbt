fn prefix_sum(arr: &List<Int>) -> List<Int> {
  let mut prefix = List<Int>::new_with_size(arr.size() + 1, 0)

  for i = 0; i < arr.size(); i = i + 1 {
    prefix[i + 1] = prefix[i] + arr[i]
  }

  return prefix
}

fn main {
  let arr = [3, 1, 4, 1, 5, 9, 2]
  let prefix = prefix_sum(&arr)
  
  // 累積和を表示
  println("Prefix sums: ", prefix)

  // 例: 2番目から5番目の要素の合計を取得する
  let left = 2
  let right = 5
  let sum = prefix[right + 1] - prefix[left]
  println("Sum from index ", left, " to ", right, " is: ", sum)
}
