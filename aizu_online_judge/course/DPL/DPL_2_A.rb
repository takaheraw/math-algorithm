# 巡回セールスマン問題の解法
# ビットマスクDPを使用して最短経路を求める

def solve_tsp
  # 入力の読み込み
  v, e = gets.split.map(&:to_i)
  
  # グラフの隣接行列を初期化（存在しない辺は無限大）
  inf = Float::INFINITY
  graph = Array.new(v) { Array.new(v, inf) }
  
  # エッジ情報の読み込み
  e.times do
    s, t, d = gets.split.map(&:to_i)
    graph[s][t] = d
  end
  
  # dp[mask][i] = 集合maskの頂点を訪問して、現在頂点iにいる時の最短距離
  # maskはビットマスクで、各ビットが対応する頂点の訪問状態を表す
  dp = Array.new(1 << v) { Array.new(v, inf) }
  
  # 開始点は頂点0とする
  # 頂点0のみを訪問した状態で頂点0にいる場合のコストは0
  dp[1][0] = 0
  
  # 全ての状態を順番に処理
  (1 << v).times do |mask|
    v.times do |i|
      # 現在の状態が無効な場合はスキップ
      next if dp[mask][i] == inf
      # 頂点iが訪問済みでない場合はスキップ
      next if (mask & (1 << i)) == 0
      
      # 次に訪問する頂点を選択
      v.times do |j|
        # 既に訪問済みの頂点はスキップ
        next if (mask & (1 << j)) != 0
        # 辺が存在しない場合はスキップ
        next if graph[i][j] == inf

        # 新しい状態への遷移
        new_mask = mask | (1 << j)
        new_cost = dp[mask][i] + graph[i][j]
        
        # より良い経路が見つかった場合は更新
        if new_cost < dp[new_mask][j]
          dp[new_mask][j] = new_cost
        end
      end
    end
  end
  
  # 全ての頂点を訪問した状態から開始点に戻る最短距離を計算
  all_visited = (1 << v) - 1
  result = inf
  
  v.times do |i|
    next if i == 0  # 開始点は除く
    next if dp[all_visited][i] == inf  # 到達不可能な場合はスキップ
    next if graph[i][0] == inf  # 開始点への辺が存在しない場合はスキップ
    
    # 頂点iから開始点0に戻るコストを加算
    total_cost = dp[all_visited][i] + graph[i][0]
    result = [result, total_cost].min
  end
  
  # 結果の出力
  if result == inf
    puts -1
  else
    puts result
  end
end

# メイン処理の実行
solve_tsp
