# 素数判定
def prime?(n)
  # 2未満の数は素数ではない
  return false if n < 2

  # 2から√nまでの各整数で割り切れるかをチェック
  (2..Math.sqrt(n)).each do |i|
    puts "#{n} % #{i}"
    return false if n % i == 0
  end

  # どの整数でも割り切れなければ素数
  true
end

numbers = [1, 2, 3, 4, 5, 16, 17, 18, 19, 20]
numbers.each do |num|
  puts "#{num}は#{ prime?(num) ? "素数" : "素数ではない" }"
end

# 最大公約数
def gcd(a, b)
  while a >= 1 && b >= 1
    if a >= b
      a = a % b
    else
      b = b % a
    end
  end

  a >= 1 ? a : b
end

puts gcd(48, 18)  # 出力: 6
puts gcd(100, 25) # 出力: 25
puts gcd(7, 3)    # 出力: 1

# 最小公倍数
def lcm(a, b)
  a * b / gcd(a, b)
end

puts lcm(12, 18)  # 出力: 36
puts lcm(7, 5)    # 出力: 35
puts lcm(21, 6)   # 出力: 42

# 素因数分解
def prime_factors(n)
  factors = []
  divisor = 2

  while n > 1
    while n % divisor == 0
      factors << divisor
      n /= divisor
    end
    divisor += 1
  end

  factors
end

number = 84
puts "#{number} の素因数分解: #{prime_factors(number).join(' × ')}"
