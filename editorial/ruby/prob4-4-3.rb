# 入力
n = gets.to_i
f = Array.new(n + 1, 0)

# F[1], F[2], ..., F[N] を計算する
(1..n).each do |i|
  # F[i], F[2i], F[3i], ... に 1 を加算
  (1..(n / i)).each do |j|
    f[j * i] += 1
  end
end

# 答えを求める
answer = 0
(1..n).each do |i|
  answer += i * f[i]
end

# 出力
puts answer
