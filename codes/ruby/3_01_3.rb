# 入力
n = gets.to_i

# すべての約数を求め、配列 divisors に入れる
limit = Math.sqrt(n).to_i
divisors = []
(1..limit).each do |i|
  if n % i == 0
    divisors << i
    divisors << n / i unless i == n / i
  end
end

# 小さい順に並べ替え → 出力
divisors.sort.each do |i|
  puts i
end
