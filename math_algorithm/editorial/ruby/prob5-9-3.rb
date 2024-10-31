# 入力
n = gets.to_i
a = []
n.times do
  a_end, a_start = gets.split.map(&:to_i)
  a << [a_start, a_end]
end

# ソート
a.sort!

# 終了時刻が最も早いものを選び続ける
current_time = 0
answer = 0
n.times do |i|
  if current_time <= a[i][1]
    current_time = a[i][0]
    answer += 1
  end
end

# 出力
puts answer
