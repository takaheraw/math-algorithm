# 整数 m の各桁の積を返す関数
def product(m)
  return 0 if m == 0

  ans = 1
  while m >= 1
    ans *= (m % 10)
    m /= 10
  end
  ans
end

# 各桁の積の候補の集合を返す関数
def func(digit, m)
  return [product(m)].to_set if digit == 11

  # 次の桁を探索
  # min_value は cur の最後の桁（単調増加にするためには次の桁がそれ以上でなければならない）
  min_value = m % 10
  ret = Set.new
  (min_value..9).each do |i|
    r = func(digit + 1, m * 10 + i)
    r.each { |j| ret.add(j) }
  end
  ret
end

# 入力
n, b = gets.split.map(&:to_i)

# 各桁の積の候補を列挙
fm_cand = func(0, 0)

# m - f(m) = B になるかどうかチェック
answer = 0
fm_cand.each do |fm|
  m = fm + b # 各桁の積から導かれる m の値
  prod_m = product(m) # 本来の f(m) の値
  answer += 1 if m - prod_m == b && m <= n
end

# 出力
puts answer
