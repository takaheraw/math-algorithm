struct SegmentTree {
    tree: Vec<i32>,
    n: usize,
}

impl SegmentTree {
    fn new(data: Vec<i32>) -> Self {
        let n = data.len();
        let mut tree = vec![0; 2 * n];
        let mut seg_tree = SegmentTree { tree, n };
        seg_tree.build(data);
        seg_tree
    }

    fn build(&mut self, data: Vec<i32>) {
        // Initialize leaves
        for i in 0..self.n {
            self.tree[self.n + i] = data[i];
        }

        // Build the tree by calculating parents
        for i in (1..self.n).rev() {
            self.tree[i] = self.tree[2 * i] + self.tree[2 * i + 1];
        }
    }

    fn update(&mut self, mut index: usize, value: i32) {
        // Set value at position p
        index += self.n;
        self.tree[index] = value;

        // Move upward and update parents
        while index > 1 {
            index /= 2;
            self.tree[index] = self.tree[2 * index] + self.tree[2 * index + 1];
        }
    }

    fn query(&self, mut left: usize, mut right: usize) -> i32 {
        // sum on interval [l, r)
        let mut result = 0;
        left += self.n;
        right += self.n;

        while left < right {
            if left % 2 == 1 {
                result += self.tree[left];
                left += 1;
            }
            if right % 2 == 1 {
                right -= 1;
                result += self.tree[right];
            }
            left /= 2;
            right /= 2;
        }

        result
    }
}

// 使用例
fn main() {
    let data = vec![1, 3, 5, 7, 9, 11];
    let mut seg_tree = SegmentTree::new(data);

    // 配列の範囲 [1, 4) の合計をクエリ
    println!("{}", seg_tree.query(1, 4)); // 3 + 5 + 7 = 15

    // インデックス 2 の値を 10 に更新
    seg_tree.update(2, 10);

    // 再度クエリ
    println!("{}", seg_tree.query(1, 4)); // 3 + 10 + 7 = 20
}
