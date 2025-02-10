# 入力の読み込み
n = gets.to_i
activities = []

n.times do
  s, t = gets.split.map(&:to_i)
  activities << [s, t]
end

# 終了時間が早い順にソート
activities.sort_by! { |_, finish| finish }

# 貪欲法で活動を選択
max_activities = 0
last_finish_time = 0

activities.each do |start, finish|
  if start >= last_finish_time
    max_activities += 1
    last_finish_time = finish
  end
end

# 結果を出力
puts max_activities
