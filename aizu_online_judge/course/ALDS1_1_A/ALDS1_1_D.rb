def max_profit(n, rates)
  min_rate = rates[0]
  max_profit = -Float::INFINITY

  (1...n).each do |i|
    max_profit = [max_profit, rates[i] - min_rate].max
    min_rate = [min_rate, rates[i]].min
  end

  max_profit
end

# 入力の読み取り
n = gets.to_i
rates = Array.new(n) { gets.to_i }

# 最大利益の計算と出力
puts max_profit(n, rates)
