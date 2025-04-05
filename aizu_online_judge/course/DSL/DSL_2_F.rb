class LazySegmentTree
  def initialize(n)
    @size = 1
    while @size < n
      @size *= 2
    end
    
    # データ配列とLazy配列を初期化（初期値は2^31-1）
    @data = Array.new(2 * @size, (1 << 31) - 1)
    @lazy = Array.new(2 * @size, nil)
  end
  
  # 範囲更新: [s, t)の範囲をxに更新
  def update(s, t, x)
    update_internal(s, t, x, 0, 0, @size)
  end
  
  # 範囲最小値クエリ: [s, t)の最小値を取得
  def find(s, t)
    find_internal(s, t, 0, 0, @size)
  end
  
  private
  
  # 遅延評価の伝播
  def propagate(k, left, right)
    if @lazy[k] != nil
      # 葉ノードでない場合は子に伝播
      if right - left > 1
        @lazy[2*k+1] = @lazy[k]
        @lazy[2*k+2] = @lazy[k]
      end
      
      # 自ノードの値を更新
      @data[k] = @lazy[k]
      @lazy[k] = nil
    end
  end
  
  def update_internal(s, t, x, k, left, right)
    # 伝播
    propagate(k, left, right)
    
    # 範囲外の場合
    if right <= s || t <= left
      return
    end
    
    # 完全に含まれる場合
    if s <= left && right <= t
      @lazy[k] = x
      propagate(k, left, right)
      return
    end
    
    # 一部だけ含まれる場合、子ノードを更新
    mid = (left + right) / 2
    update_internal(s, t, x, 2*k+1, left, mid)
    update_internal(s, t, x, 2*k+2, mid, right)
    
    # 子ノードの情報を使って自ノードを更新
    @data[k] = [@data[2*k+1], @data[2*k+2]].min
  end
  
  def find_internal(s, t, k, left, right)
    # 伝播
    propagate(k, left, right)
    
    # 範囲外の場合
    if right <= s || t <= left
      return (1 << 31) - 1
    end
    
    # 完全に含まれる場合
    if s <= left && right <= t
      return @data[k]
    end
    
    # 一部だけ含まれる場合、子ノードから取得
    mid = (left + right) / 2
    left_min = find_internal(s, t, 2*k+1, left, mid)
    right_min = find_internal(s, t, 2*k+2, mid, right)
    
    return [left_min, right_min].min
  end
end

# 入力の処理
n, q = gets.split.map(&:to_i)
seg_tree = LazySegmentTree.new(n)

q.times do
  query = gets.split.map(&:to_i)
  
  if query[0] == 0
    # update operation
    s, t, x = query[1], query[2], query[3]
    seg_tree.update(s, t+1, x)  # インクルーシブな範囲[s, t]をエクスクルーシブな範囲[s, t+1)に変換
  else
    # find operation
    s, t = query[1], query[2]
    puts seg_tree.find(s, t+1)  # インクルーシブな範囲[s, t]をエクスクルーシブな範囲[s, t+1)に変換
  end
end
