// 部分集合の全ての和を列挙する関数
fn generate_subsets_sums(arr: &List<Int>) -> List<Int> {
  let mut sums = List<Int>::new()
  let n = arr.size()

  // 各部分集合を全列挙
  for i in 0..(1 << n) {
    let mut sum = 0
    for j in 0..n {
      if (i & (1 << j)) != 0 {
        sum = sum + arr[j]
      }
    }
    sums.push(sum)
  }

  return sums
}

fn half_enumeration(arr: &List<Int>, S: Int) -> Bool {
  let n = arr.size()
  let left = arr[0:(n / 2)]
  let right = arr[(n / 2):]

  // 左半分と右半分の全ての部分集合の和を生成
  let left_sums = generate_subsets_sums(&left)
  let mut right_sums = generate_subsets_sums(&right)

  // 右半分の部分和をソートして二分探索を可能にする
  right_sums.sort()

  // 左半分の各部分和と右半分の部分和で合計がSになるかを確認
  for &sum in left_sums.iter() {
    let target = S - sum
    if right_sums.binary_search(&target).is_ok() {
      return true  // Sを作れる部分集合が見つかった
    }
  }

  return false  // Sを作れる部分集合が見つからなかった
}

fn main {
  let arr = [3, 34, 4, 12, 5, 2]
  let S = 9
  let result = half_enumeration(&arr, S)

  if result {
    println("Subset with sum ", S, " exists.")
  } else {
    println("No subset with sum ", S, " exists.")
  }
}
