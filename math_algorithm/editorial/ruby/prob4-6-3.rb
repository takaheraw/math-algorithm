# 繰り返し二乗法（p は a**1, a**2, a**4, a**8, ... といった値をとる）
def modpow(a, b, m)
  p = a
  answer = 1
  60.times do |i|
    answer = (answer * p) % m if (b & (1 << i)) != 0
    p = (p * p) % m
  end
  answer
end

# division(a, b, m) は a÷b mod m を返す関数
def division(a, b, m)
  (a * modpow(b, m - 2, m)) % m
end

# 入力
mod = 1_000_000_007
n = gets.to_i

# 答えの計算
v = modpow(4, n + 1, mod) - 1
answer = division(v, 3, mod)

# 出力
puts answer
