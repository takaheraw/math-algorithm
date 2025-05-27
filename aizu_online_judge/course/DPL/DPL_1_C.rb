# 入力を読み込む
n, w = gets.split.map(&:to_i)
items = []
n.times do
  v, weight = gets.split.map(&:to_i)
  items << [v, weight]
end

# DP配列を初期化
# dp[i] = 重さiまでのナップサックに入れられる最大価値
dp = Array.new(w + 1, 0)

# 各アイテムについて処理
items.each do |value, weight|
  # 重さweight以上の全ての容量について更新
  (weight..w).each do |current_weight|
    # 現在のアイテムを追加した場合の価値を計算
    new_value = dp[current_weight - weight] + value
    # より良い価値が得られる場合は更新
    dp[current_weight] = [dp[current_weight], new_value].max
  end
end

# 答えを出力
puts dp[w]
