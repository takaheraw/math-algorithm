#include <iostream>
#include <vector>

class SegmentTree {
private:
    std::vector<int> tree;
    int n;

    // Build the segment tree
    void build(const std::vector<int>& data, int node, int start, int end) {
        if (start == end) {
            tree[node] = data[start];
        } else {
            int mid = (start + end) / 2;
            build(data, 2 * node + 1, start, mid);
            build(data, 2 * node + 2, mid + 1, end);
            tree[node] = tree[2 * node + 1] + tree[2 * node + 2];
        }
    }

    // Update the segment tree
    void update(int node, int start, int end, int idx, int val) {
        if (start == end) {
            tree[node] = val;
        } else {
            int mid = (start + end) / 2;
            if (start <= idx && idx <= mid) {
                update(2 * node + 1, start, mid, idx, val);
            } else {
                update(2 * node + 2, mid + 1, end, idx, val);
            }
            tree[node] = tree[2 * node + 1] + tree[2 * node + 2];
        }
    }

    // Query the segment tree
    int query(int node, int start, int end, int L, int R) {
        if (R < start || end < L) {
            return 0;
        }
        if (L <= start && end <= R) {
            return tree[node];
        }
        int mid = (start + end) / 2;
        int leftSum = query(2 * node + 1, start, mid, L, R);
        int rightSum = query(2 * node + 2, mid + 1, end, L, R);
        return leftSum + rightSum;
    }

public:
    SegmentTree(const std::vector<int>& data) {
        n = data.size();
        tree.resize(4 * n);
        build(data, 0, 0, n - 1);
    }

    void update(int idx, int val) {
        update(0, 0, n - 1, idx, val);
    }

    int query(int L, int R) {
        return query(0, 0, n - 1, L, R);
    }
};

int main() {
    std::vector<int> data(5);
    data[0] = 1;
    data[1] = 2;
    data[2] = 3;
    data[3] = 4;
    data[4] = 5;

    SegmentTree segTree(data);

    // 区間 [1, 3] の和を求める
    std::cout << "Sum of range [1, 3]: " << segTree.query(1, 3) << std::endl;

    // 位置 2 の値を 10 に更新する
    segTree.update(2, 10);

    // 再び区間 [1, 3] の和を求める
    std::cout << "Sum of range [1, 3] after update: " << segTree.query(1, 3) << std::endl;

    return 0;
}
