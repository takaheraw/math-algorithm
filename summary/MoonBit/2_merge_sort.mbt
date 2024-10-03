fn merge(left: &List<Int>, right: &List<Int>) -> List<Int> {
  let mut result = []
  let mut i = 0
  let mut j = 0

  // 左右のリストをマージする
  while i < left.size() && j < right.size() {
    if left[i] < right[j] {
      result.push(left[i])
      i = i + 1
    } else {
      result.push(right[j])
      j = j + 1
    }
  }

  // 残りの要素を追加
  while i < left.size() {
    result.push(left[i])
    i = i + 1
  }

  while j < right.size() {
    result.push(right[j])
    j = j + 1
  }

  return result
}

fn merge_sort(arr: &List<Int>) -> List<Int> {
  // 配列が1以下ならそのまま返す
  if arr.size() <= 1 {
    return arr.clone()
  }

  // 中間地点を計算
  let mid = arr.size() / 2
  let left = merge_sort(&arr[0:mid])
  let right = merge_sort(&arr[mid:])

  // 左右をマージ
  return merge(&left, &right)
}

fn main {
  let arr = [38, 27, 43, 3, 9, 82, 10]
  let sorted_arr = merge_sort(&arr)
  println(sorted_arr)  // 出力: [3, 9, 10, 27, 38, 43, 82]
}
