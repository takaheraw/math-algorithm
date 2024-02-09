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

MOD = 1_000_000_007

a, b = gets.split.map(&:to_i)
puts modpow(a, b, MOD)
