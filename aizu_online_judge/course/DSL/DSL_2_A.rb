class SegmentTree
  INF = (2**31) - 1

  def initialize(size)
    @n = 1
    while @n < size
      @n *= 2
    end
    @data = Array.new(2 * @n, INF)
  end

  # 値の更新（update操作）
  def update(idx, val)
    idx += @n - 1
    @data[idx] = val
    while idx > 0
      idx = (idx - 1) / 2
      @data[idx] = [@data[idx * 2 + 1], @data[idx * 2 + 2]].min
    end
  end

  # 区間の最小値取得（find操作）
  def query(a, b, node = 0, l = 0, r = @n)
    # 範囲外ならINFを返す
    return INF if r <= a || b <= l
    
    # 完全に含まれる場合はその節点の値を返す
    return @data[node] if a <= l && r <= b
    
    # 一部だけ含まれる場合は子ノードに再帰的に問い合わせる
    mid = (l + r) / 2
    left_min = query(a, b, node * 2 + 1, l, mid)
    right_min = query(a, b, node * 2 + 2, mid, r)
    
    return [left_min, right_min].min
  end
end

# 入力の処理
n, q = gets.split.map(&:to_i)
st = SegmentTree.new(n)

q.times do
  com, x, y = gets.split.map(&:to_i)
  
  if com == 0
    # update操作
    st.update(x, y)
  else
    # find操作（区間最小値の取得）
    puts st.query(x, y + 1)
  end
end
