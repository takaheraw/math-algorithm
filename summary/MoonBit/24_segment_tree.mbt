struct SegmentTree {
  data: List<Int>,
  tree: List<Int>
}

fn build_tree(data: &List<Int>) -> SegmentTree {
  let n = data.size()
  let mut tree = List<Int>::new_with_size(2 * n, 0)

  // 葉ノードを設定
  for i in 0..n {
    tree[n + i] = data[i]
  }

  // 内部ノードを構築
  for i in (1..n).rev() {
    tree[i] = tree[2 * i] + tree[2 * i + 1]
  }

  return SegmentTree { data: data.clone(), tree: tree }
}

fn update(tree: &mut SegmentTree, index: Int, value: Int) {
  let n = tree.data.size()
  let mut pos = index + n
  tree.tree[pos] = value

  // 親ノードの更新
  while pos > 1 {
    pos = pos / 2
    tree.tree[pos] = tree.tree[2 * pos] + tree.tree[2 * pos + 1]
  }
}

fn query(tree: &SegmentTree, left: Int, right: Int) -> Int {
  let n = tree.data.size()
  let mut l = left + n
  let mut r = right + n
  let mut sum = 0

  while l < r {
    if (l % 2) == 1 {
      sum = sum + tree.tree[l]
      l = l + 1
    }
    if (r % 2) == 1 {
      r = r - 1
      sum = sum + tree.tree[r]
    }
    l = l / 2
    r = r / 2
  }

  return sum
}

fn main {
  let data = [1, 3, 5, 7, 9, 11]
  let mut seg_tree = build_tree(&data)

  println("Initial sum of range (1, 5): ", query(&seg_tree, 1, 5))  // 出力: 24

  update(&mut seg_tree, 2, 10)  // インデックス2の値を10に更新
  println("Updated sum of range (1, 5): ", query(&seg_tree, 1, 5))  // 出力: 29
}
