# 繰り返し二乗法（p は a**1, a**2, a**4, a**8, ... といった値をとる）
def modpow(a, b, m)
  p = a
  answer = 1
  30.times do |i|
    answer = (answer * p) % m if b & (1 << i) != 0
    p = (p * p) % m
  end
  answer
end

# division(a, b, m) は a÷b mod m を返す関数
def division(a, b, m)
  (a * modpow(b, m - 2, m)) % m
end

MOD = 1_000_000_007

# 入力
x, y = gets.split.map(&:to_i)

# 二項係数の分子と分母を求める（手順 1.／手順 2.）
bunshi = 1
bunbo = 1
(1..(x + y)).each { |i| bunshi = (bunshi * i) % MOD }
(1..x).each { |i| bunbo = (bunbo * i) % MOD }
(1..y).each { |i| bunbo = (bunbo * i) % MOD }

# 答えを求める（手順 3.）
puts division(bunshi, bunbo, MOD)
