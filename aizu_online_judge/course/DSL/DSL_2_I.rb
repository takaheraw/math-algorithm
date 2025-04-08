class SegmentTree
  def initialize(n)
    @n = 1
    @n *= 2 while @n < n
    @data = Array.new(2 * @n, 0)
    @lazy = Array.new(2 * @n, nil)
  end
  
  def update(s, t, x)
    update_sub(s, t + 1, x, 0, 0, @n)
  end
  
  def get_sum(s, t)
    get_sum_sub(s, t + 1, 0, 0, @n)
  end
  
  private
  
  def update_sub(s, t, x, k, l, r)
    eval_lazy(k)
    if r <= s || t <= l
      return
    elsif s <= l && r <= t
      @lazy[k] = x
      eval_lazy(k)
    else
      mid = (l + r) / 2
      update_sub(s, t, x, k * 2 + 1, l, mid)
      update_sub(s, t, x, k * 2 + 2, mid, r)
      @data[k] = @data[k * 2 + 1] + @data[k * 2 + 2]
    end
  end
  
  def get_sum_sub(s, t, k, l, r)
    eval_lazy(k)
    if r <= s || t <= l
      return 0
    elsif s <= l && r <= t
      return @data[k]
    else
      mid = (l + r) / 2
      lsum = get_sum_sub(s, t, k * 2 + 1, l, mid)
      rsum = get_sum_sub(s, t, k * 2 + 2, mid, r)
      return lsum + rsum
    end
  end
  
  def eval_lazy(k)
    if @lazy[k] != nil
      if k < @n - 1
        @lazy[k * 2 + 1] = @lazy[k]
        @lazy[k * 2 + 2] = @lazy[k]
      end
      
      @data[k] = @lazy[k] * (node_length(k))
      @lazy[k] = nil
    end
  end
  
  def node_length(k)
    h = Math.log2(@n).to_i
    l = h - Math.log2(k + 1).to_i
    return 2 ** l
  end
end

# 入力処理
n, q = gets.split.map(&:to_i)
seg_tree = SegmentTree.new(n)

# クエリ処理
q.times do
  query = gets.split.map(&:to_i)
  
  if query[0] == 0
    # update操作
    s, t, x = query[1], query[2], query[3]
    seg_tree.update(s, t, x)
  else
    # getSum操作
    s, t = query[1], query[2]
    puts seg_tree.get_sum(s, t)
  end
end
