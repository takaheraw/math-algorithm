# 入力
n = gets.to_i
l = Array.new(n)
r = Array.new(n)
n.times do |i|
  l[i], r[i] = gets.split.map(&:to_i)
end

# 映画の選び方のシミュレーション
# 見れる映画の終了時刻の最小値 min_endtime は、最初 1000000 (INF で設定）のようなあり得ない値にセットする
inf = 1_000_000
current_time = 0 # current_time は現在時刻（直前に見た映画の終了時刻）
answer = 0
loop do
  min_endtime = inf
  (0...n).each do |i|
    min_endtime = [min_endtime, r[i]].min if l[i] >= current_time
  end
  break if min_endtime == inf

  current_time = min_endtime
  answer += 1
end

# 答えの出力
puts answer
