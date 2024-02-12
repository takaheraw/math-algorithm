# 入力
n = gets.to_i

# 素因数分解
answer = []
limit = Math.sqrt(n).to_i
(2..limit).each do |i|
  while n % i == 0
    n /= i
    answer << i
  end
end

answer << n if n >= 2

# 出力
puts answer.join(' ')
