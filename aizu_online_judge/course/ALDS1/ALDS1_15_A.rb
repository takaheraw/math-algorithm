# 入力を取得
n = gets.to_i

# コインの種類（大きい順）
coins = [25, 10, 5, 1]

# 最小コイン数の初期化
min_coins = 0

# 各コインを使っていく
coins.each do |coin|
  # 使えるコインの数を計算
  count = n / coin
  min_coins += count
  
  # 残りの金額を更新
  n %= coin
end

# 結果を出力
puts min_coins
