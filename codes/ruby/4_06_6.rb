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

# ncr は n! を r! × (n-r)! で割った値
def ncr(n, r)
  fact = Array.new(LIMIT + 1)
  fact[0] = 1
  (1..LIMIT).each { |i| fact[i] = fact[i - 1] * i % MOD }

  division(fact[n], (fact[r] * fact[n - r]) % MOD, MOD)
end

MOD = 1_000_000_007
LIMIT = 200_000

# 入力 → 答えの出力
x, y = gets.split.map(&:to_i)
puts ncr(x + y, y)
