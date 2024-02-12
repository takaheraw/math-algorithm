# 正の整数 A と B の最大公約数を返す関数
def gcd(a, b)
  while a >= 1 && b >= 1
    if a < b
      b %= a # A < B の場合、大きい方 B を書き換える
    else
      a %= b # A >= B の場合、大きい方 A を書き換える
    end
  end
  a >= 1 ? a : b
end

# 入力
n = gets.to_i
a = gets.split.map(&:to_i)

# 答えを求める
r = gcd(a[0], a[1])
(2...n).each do |i|
  r = gcd(r, a[i])
end

# 出力
puts r
