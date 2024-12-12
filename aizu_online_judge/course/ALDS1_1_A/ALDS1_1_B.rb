def gcd(a, b)
  while b != 0
    a, b = b, a % b
  end
  a
end

# 入力の読み取り
a, b = gets.split.map(&:to_i)

# 最大公約数の計算と出力
puts gcd(a, b)
