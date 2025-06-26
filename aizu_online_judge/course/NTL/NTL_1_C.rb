# 最大公約数を求める関数（ユークリッドの互除法）
def gcd(a, b)
  while b != 0
    a, b = b, a % b
  end
  a
end

# 最小公倍数を求める関数
def lcm(a, b)
  (a * b) / gcd(a, b)
end

# 複数の数の最小公倍数を求める関数
def lcm_multiple(numbers)
  result = numbers[0]
  (1...numbers.length).each do |i|
    result = lcm(result, numbers[i])
  end
  result
end

# 入力を読み取り
n = gets.to_i
numbers = gets.split.map(&:to_i)

# 最小公倍数を計算して出力
puts lcm_multiple(numbers)
