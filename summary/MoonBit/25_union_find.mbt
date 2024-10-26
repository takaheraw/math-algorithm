struct UnionFind {
  parent: List<Int>,
  rank: List<Int>
}

fn union_find_new(size: Int) -> UnionFind {
  let mut parent = List<Int>::new_with_size(size, 0)
  let mut rank = List<Int>::new_with_size(size, 0)

  for i in 0..size {
    parent[i] = i  // 各要素は最初、自分自身が親
    rank[i] = 1    // 各集合の初期ランクは1
  }

  return UnionFind { parent: parent, rank: rank }
}

fn find(uf: &mut UnionFind, x: Int) -> Int {
  if uf.parent[x] != x {
    // 経路圧縮: 親を再帰的に更新して根に直接つなぐ
    uf.parent[x] = find(uf, uf.parent[x])
  }
  return uf.parent[x]
}

fn union(uf: &mut UnionFind, x: Int, y: Int) {
  let root_x = find(uf, x)
  let root_y = find(uf, y)

  if root_x != root_y {
    // ランクに基づいて結合（ランクの低い方を高い方に結合）
    if uf.rank[root_x] > uf.rank[root_y] {
      uf.parent[root_y] = root_x
    } else if uf.rank[root_x] < uf.rank[root_y] {
      uf.parent[root_x] = root_y
    } else {
      uf.parent[root_y] = root_x
      uf.rank[root_x] = uf.rank[root_x] + 1
    }
  }
}

fn main {
  let mut uf = union_find_new(10)

  // いくつかの要素を結合
  union(&mut uf, 1, 2)
  union(&mut uf, 2, 3)
  union(&mut uf, 4, 5)
  union(&mut uf, 6, 7)

  // 同じ集合に属するかの確認
  println("1 and 3 are in the same set: ", find(&mut uf, 1) == find(&mut uf, 3))  // true
  println("1 and 4 are in the same set: ", find(&mut uf, 1) == find(&mut uf, 4))  // false
}
