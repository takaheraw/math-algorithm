# 正の整数 A と B の最大公約数を返す関数
# GCD は Greatest Common Divisor（最大公約数）の略
def gcd(a, b)
  while a >= 1 && b >= 1
    if a < b
      b = b % a  # A < B の場合、大きい方 B を書き換える
    else
      a = a % b  # A >= B の場合、大きい方 A を書き換える
    end
  end
  a >= 1 ? a : b
end

a, b = gets.chomp.split.map(&:to_i)
puts gcd(a, b)
