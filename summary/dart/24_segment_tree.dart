class SegmentTree {
  late List<int> tree;
  late int n;

  SegmentTree(List<int> arr) {
    n = arr.length;
    tree = List<int>.filled(2 * n, 0);
    _build(arr);
  }

  // 配列からセグメント木を構築
  void _build(List<int> arr) {
    for (int i = 0; i < n; i++) {
      tree[n + i] = arr[i];
    }
    for (int i = n - 1; i > 0; --i) {
      tree[i] = tree[i * 2] + tree[i * 2 + 1];
    }
  }

  // 区間クエリ
  int query(int l, int r) {
    l += n;
    r += n;
    int sum = 0;
    while (l < r) {
      if ((l & 1) == 1) {
        sum += tree[l];
        l++;
      }
      if ((r & 1) == 1) {
        r--;
        sum += tree[r];
      }
      l ~/= 2;
      r ~/= 2;
    }
    return sum;
  }

  // 要素の更新
  void update(int pos, int value) {
    pos += n;
    tree[pos] = value;
    while (pos > 1) {
      pos ~/= 2;
      tree[pos] = tree[2 * pos] + tree[2 * pos + 1];
    }
  }
}

void main() {
  List<int> arr = [1, 3, 5, 7, 9, 11];
  SegmentTree segTree = SegmentTree(arr);

  print(segTree.query(1, 3)); // 出力: 8 (3 + 5)
  segTree.update(1, 10);
  print(segTree.query(1, 3)); // 出力: 15 (10 + 5)
}
