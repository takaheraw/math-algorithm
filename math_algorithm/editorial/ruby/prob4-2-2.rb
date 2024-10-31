# 入力
t = gets.to_i
n = gets.to_i
a = Array.new(t + 2, 0)
b = Array.new(t + 2, 0)
l = Array.new(n)
r = Array.new(n)
n.times do |i|
  l[i], r[i] = gets.split.map(&:to_i)
end

# 階差 b[i] を計算する
n.times do |i|
  b[l[i]] += 1
  b[r[i]] -= 1
end

# 累積和 a[i] を計算する
a[0] = b[0]
1.upto(t - 1) do |i|
  a[i] = a[i - 1] + b[i]
end

# 出力
t.times do |i|
  puts a[i]
end
