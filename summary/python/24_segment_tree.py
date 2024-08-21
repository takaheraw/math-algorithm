class SegmentTree:
    def __init__(self, data):
        self.n = len(data)
        self.tree = [0] * (2 * self.n)
        self.build(data)

    def build(self, data):
        # Initialize leaves
        for i in range(self.n):
            self.tree[self.n + i] = data[i]
        
        # Build the tree by calculating parents
        for i in range(self.n - 1, 0, -1):
            self.tree[i] = self.tree[2 * i] + self.tree[2 * i + 1]

    def update(self, index, value):
        # Set value at position index
        index += self.n
        self.tree[index] = value

        # Move upward and update parents
        while index > 1:
            index //= 2
            self.tree[index] = self.tree[2 * index] + self.tree[2 * index + 1]

    def query(self, left, right):
        # Sum on interval [left, right)
        result = 0
        left += self.n
        right += self.n

        while left < right:
            if left % 2 == 1:
                result += self.tree[left]
                left += 1
            if right % 2 == 1:
                right -= 1
                result += self.tree[right]
            left //= 2
            right //= 2

        return result

# 使用例
if __name__ == "__main__":
    data = [1, 3, 5, 7, 9, 11]
    seg_tree = SegmentTree(data)

    # 配列の範囲 [1, 4) の合計をクエリ
    print(seg_tree.query(1, 4))  # 3 + 5 + 7 = 15

    # インデックス 2 の値を 10 に更新
    seg_tree.update(2, 10)

    # 再度クエリ
    print(seg_tree.query(1, 4))  # 3 + 10 + 7 = 20
