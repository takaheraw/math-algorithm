# 入力を読み取る
n, q = gets.chomp.split.map(&:to_i)

# 配列を初期化（すべての要素が0）
a = Array.new(n + 1, 0)  # 1-indexedなので、n+1の大きさにする

# クエリを処理
q.times do
  com, x, y = gets.chomp.split.map(&:to_i)
  
  if com == 0  # add(x, y)操作
    a[x] += y
  elsif com == 1  # getSum(x, y)操作
    sum = 0
    (x..y).each do |i|
      sum += a[i]
    end
    puts sum
  end
end
