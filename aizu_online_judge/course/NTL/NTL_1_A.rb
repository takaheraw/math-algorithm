n = gets.to_i
original_n = n
factors = []

# 2で割り切れるだけ割る
while n % 2 == 0
  factors << 2
  n /= 2
end

# 3以上の奇数で割り切れるだけ割る
i = 3
while i * i <= n
  while n % i == 0
    factors << i
    n /= i
  end
  i += 2
end

# nが1より大きければ、それは素数
if n > 1
  factors << n
end

# 結果を出力
print "#{original_n}:"
factors.each { |factor| print " #{factor}" }
puts
