class SegmentTree
  attr_accessor :tree, :n

  def initialize(data)
    @n = data.size
    @tree = Array.new(2 * @n)
    build(data)
  end

  def build(data)
    # Initialize leaves
    for i in 0...@n
      @tree[@n + i] = data[i]
    end

    # Build the tree by calculating parents
    for i in (1...@n).reverse_each
      @tree[i] = @tree[2 * i] + @tree[2 * i + 1]
    end
  end

  def update(index, value)
    # Set value at position p
    index += @n
    @tree[index] = value

    # Move upward and update parents
    while index > 1
      index /= 2
      @tree[index] = @tree[2 * index] + @tree[2 * index + 1]
    end
  end

  def query(left, right)
    # sum on interval [l, r)
    result = 0
    left += @n
    right += @n

    while left < right
      if (left % 2) == 1
        result += @tree[left]
        left += 1
      end
      if (right % 2) == 1
        right -= 1
        result += @tree[right]
      end
      left /= 2
      right /= 2
    end

    result
  end
end

# 使用例
data = [1, 3, 5, 7, 9, 11]
seg_tree = SegmentTree.new(data)

# 配列の範囲 [1, 4) の合計をクエリ
puts seg_tree.query(1, 4) # 3 + 5 + 7 = 15

# インデックス 2 の値を 10 に更新
seg_tree.update(2, 10)

# 再度クエリ
puts seg_tree.query(1, 4) # 3 + 10 + 7 = 20
