class UnionFind {
  List<int> parent;
  List<int> rank;

  UnionFind(int size)
      : parent = List<int>.generate(size, (i) => i),
        rank = List<int>.filled(size, 0);

  int find(int x) {
    if (parent[x] != x) {
      parent[x] = find(parent[x]); // パス圧縮
    }
    return parent[x];
  }

  void union(int x, int y) {
    int rootX = find(x);
    int rootY = find(y);

    if (rootX != rootY) {
      // ランクによる統合
      if (rank[rootX] > rank[rootY]) {
        parent[rootY] = rootX;
      } else if (rank[rootX] < rank[rootY]) {
        parent[rootX] = rootY;
      } else {
        parent[rootY] = rootX;
        rank[rootX]++;
      }
    }
  }
}

void main() {
  UnionFind uf = UnionFind(10);

  uf.union(1, 2);
  uf.union(2, 3);
  uf.union(4, 5);
  uf.union(6, 7);
  uf.union(5, 6);

  print(uf.find(1)); // 出力例: 1
  print(uf.find(2)); // 出力例: 1
  print(uf.find(3)); // 出力例: 1
  print(uf.find(4)); // 出力例: 4
  print(uf.find(5)); // 出力例: 4
  print(uf.find(6)); // 出力例: 4
  print(uf.find(7)); // 出力例: 4
  print(uf.find(8)); // 出力例: 8
}
