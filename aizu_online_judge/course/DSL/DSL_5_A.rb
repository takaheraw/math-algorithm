# 入力の処理
input = gets.split.map(&:to_i)
n, t = input

# イベント配列の作成（入店と退店）
events = []
n.times do
  l, r = gets.split.map(&:to_i)
  events << [l, 1]  # 入店: +1
  events << [r, -1] # 退店: -1
end

# 時間順にイベントをソート
events.sort!

# 現在の人数と最大人数を追跡
current = 0
max_people = 0

# 各イベントを処理
events.each do |time, change|
  current += change
  max_people = [max_people, current].max
end

# 結果を出力
puts max_people
