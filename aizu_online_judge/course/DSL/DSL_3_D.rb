N, L = gets.split.map(&:to_i)
array = gets.split.map(&:to_i)

# デックを使用して効率的に各ウィンドウの最小値を求める
def sliding_minimum(arr, n, l)
  result = []
  deque = [] # [index, value]のペアを格納するデック
  
  # 最初のウィンドウを処理
  (0...l).each do |i|
    # デックの末尾から、現在の要素より大きい要素を削除（不要な要素）
    while !deque.empty? && deque.last[1] >= arr[i]
      deque.pop
    end
    # 現在の要素をデックに追加
    deque.push([i, arr[i]])
  end
  
  # 最初のウィンドウの最小値を追加
  result << deque.first[1]
  
  # 残りのウィンドウを処理
  (l...n).each do |i|
    # ウィンドウの範囲外になった要素をデックから削除
    while !deque.empty? && deque.first[0] <= i - l
      deque.shift
    end
    
    # デックの末尾から、現在の要素より大きい要素を削除
    while !deque.empty? && deque.last[1] >= arr[i]
      deque.pop
    end
    
    # 現在の要素をデックに追加
    deque.push([i, arr[i]])
    
    # 現在のウィンドウの最小値を追加
    result << deque.first[1]
  end
  
  return result
end

minimums = sliding_minimum(array, N, L)
puts minimums.join(' ')
