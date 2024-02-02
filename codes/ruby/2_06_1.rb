# 入力
n, s = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

answer = 'No'
(0...(1 << n)).each do |i|
  partsum = 0
  (0...n).each do |j|
    partsum += a[j] if (i & (1 << j)) != 0
  end
  if partsum == s
    answer = 'Yes'
    break
  end
end

# 出力
puts answer
