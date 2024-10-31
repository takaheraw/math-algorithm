# 繰り返し二乗法（p は a**1, a**2, a**4, a**8, ... といった値をとる）
def modpow(a, b, m)
  p_val = a
  answer = 1
  30.times do |i|
    answer = (answer * p_val) % m if (b & (1 << i)) != 0
    p_val = (p_val * p_val) % m
  end
  answer
end

# division(a, b, m) は a÷b mod m を返す関数
def division(a, b, m)
  (a * modpow(b, m - 2, m)) % m
end

# ncr は n! を r! × (n-r)! で割った値
def ncr(n, r)
  fact = [1] * (limit + 1)
  (1..limit).each do |i|
    fact[i] = fact[i - 1] * i % mod
  end
  division(fact[n], fact[r] * fact[n - r] % mod, mod)
end

mod = 1_000_000_007
limit = 200_000

# 入力
n = gets.chomp.to_i
a = gets.chomp.split.map(&:to_i)

# 答えを求める
answer = 0
n.times do |i|
  answer += a[i] * ncr(n - 1, i)
  answer %= mod
end

# 答えの出力
puts answer
