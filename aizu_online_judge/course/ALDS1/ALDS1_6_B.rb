def counting_sort(arr, max_value)
# ステップ 1: カウント配列を初期化
count = Array.new(max_value + 1, 0)

# ステップ 2: 各要素のカウント
arr.each do |num|
  count[num] += 1
end

# ステップ 3: カウントの累積和を計算
(1..max_value).each do |i|
  count[i] += count[i - 1]
end

# ステップ 4: 結果配列を構築
output = Array.new(arr.size)
arr.reverse_each do |num|
  output[count[num] - 1] = num
  count[num] -= 1
end

output
end

# 入力の読み込み
n = gets.to_i
arr = gets.split.map(&:to_i)

# 最大値を取得
max_value = arr.max

# カウントソートを実行
sorted_array = counting_sort(arr, max_value)

# 結果を出力
puts sorted_array.join(" ")
