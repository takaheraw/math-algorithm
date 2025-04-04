n, q = gets.split.map(&:to_i)

# 実際の値を直接保持する配列
arr = Array.new(n + 1, 0)

q.times do
  query = gets.split.map(&:to_i)
  
  if query[0] == 0
    # add(s, t, x)操作
    s, t, x = query[1], query[2], query[3]
    (s..t).each do |i|
      arr[i] += x
    end
  else
    # get(i)操作
    i = query[1]
    puts arr[i]
  end
end
