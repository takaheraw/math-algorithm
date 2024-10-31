# 正の整数 A と B の最大公約数を返す関数
# GCD は Greatest Common Divisor（最大公約数）の略
def gcd(a, b)
  answer = 0
  1.upto([a, b].min) do |i|
    answer = i if a % i == 0 && b % i == 0
  end
  answer
end

a, b = gets.chomp.split.map(&:to_i)
puts gcd(a, b)
