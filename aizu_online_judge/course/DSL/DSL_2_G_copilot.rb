n, q = gets.split.map(&:to_i)
array = Array.new(n + 1, 0)  # 1-indexedで配列を作成

q.times do
  query = gets.split.map(&:to_i)
  type = query[0]
  
  if type == 0  # add操作
    s, t, x = query[1], query[2], query[3]
    
    # 区間[s, t]の各要素にxを加算
    (s..t).each do |i|
      array[i] += x
    end
    
  else  # getSum操作
    s, t = query[1], query[2]
    
    # 区間[s, t]の和を計算
    sum = 0
    (s..t).each do |i|
      sum += array[i]
    end
    
    puts sum
  end
end
