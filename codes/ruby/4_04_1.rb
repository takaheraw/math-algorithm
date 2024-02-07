# 入力 → 配列 prime の初期化
n = gets.to_i
prime = Array.new(n + 1, true)

# エラトステネスのふるい
limit = Math.sqrt(n).to_i
(2..limit).each do |i|
  next unless prime[i]

  # x = 2i, 3i, 4i, ... と、N 以下の間ループし続ける
  (2 * i..n).step(i).each do |j|
    prime[j] = false
  end
end

# N 以下の素数を小さい順に出力
(2..n).each do |i|
  puts i if prime[i]
end
