# 入力
n, r = gets.split.map(&:to_i)

# 階乗の計算
fact_n = (1..n).reduce(1, :*)
fact_r = (1..r).reduce(1, :*)
fact_nr = (1..n - r).reduce(1, :*)

# 出力
puts fact_n / (fact_r * fact_nr)
