#!/usr/bin/env ruby

# 標準入力から読み込み
input = gets.split.map(&:to_i)
node_count = input[0]
edge_count = input[1]

# 隣接リストの作成
adj_list = Array.new(node_count) { [] }
edge_count.times do
  source, target = gets.split.map(&:to_i)
  adj_list[source] << target
end

# DFSを使用して閉路を検出する関数
def has_cycle?(adj_list)
  # 0: 未訪問, 1: 探索中, 2: 完了
  status = Array.new(adj_list.size, 0)
  
  (0...adj_list.size).each do |node|
    if status[node] == 0 && dfs_detect_cycle(node, adj_list, status)
      return true
    end
  end
  
  return false
end

# 再帰的にDFSを実行して閉路を検出
def dfs_detect_cycle(node, adj_list, status)
  # ノードを探索中としてマーク
  status[node] = 1
  
  adj_list[node].each do |neighbor|
    # 未訪問のノードなら再帰的に探索
    if status[neighbor] == 0
      return true if dfs_detect_cycle(neighbor, adj_list, status)
    # 探索中のノードに戻ってきたら閉路を検出
    elsif status[neighbor] == 1
      return true
    end
  end
  
  # ノードの探索を完了としてマーク
  status[node] = 2
  return false
end

# 閉路の有無を出力（1: 閉路あり, 0: 閉路なし）
puts has_cycle?(adj_list) ? 1 : 0
