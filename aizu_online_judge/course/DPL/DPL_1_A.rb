# Coin Changing Problem - 最小コイン枚数を求める
# 動的プログラミングによる解法

def coin_change(n, coins)
  # dp[i] = i円を作るのに必要な最小コイン枚数
  dp = Array.new(n + 1, Float::INFINITY)
  dp[0] = 0  # 0円を作るのに必要なコイン枚数は0枚
  
  # 各金額について計算
  (1..n).each do |amount|
    coins.each do |coin|
      # そのコインが使える場合（金額以下の場合）
      if coin <= amount
        dp[amount] = [dp[amount], dp[amount - coin] + 1].min
      end
    end
  end
  
  dp[n]
end

# 入力の読み取り
n, m = gets.split.map(&:to_i)
coins = gets.split.map(&:to_i)

# 結果の出力
result = coin_change(n, coins)
puts result
