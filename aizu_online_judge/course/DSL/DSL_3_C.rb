# 入力の読み込み
n, q = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
queries = gets.split.map(&:to_i)

# 累積和の計算
cumsum = [0]
a.each do |val|
  cumsum << cumsum.last + val
end

# 各クエリに対する回答
results = []
queries.each do |x|
  count = 0
  
  # 二分探索を使った解法
  (0...n).each do |l|
    # 左端をlとしたとき、条件を満たす右端の最大値を二分探索で求める
    left = l
    right = n - 1
    
    while left <= right
      mid = (left + right) / 2
      sum = cumsum[mid + 1] - cumsum[l]
      
      if sum <= x
        left = mid + 1
      else
        right = mid - 1
      end
    end
    
    # 条件を満たす範囲は[l, right]まで
    count += right - l + 1 if right >= l
  end
  
  results << count
end

# 結果を出力
results.each do |res|
  puts res
end
