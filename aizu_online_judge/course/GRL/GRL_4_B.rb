# グラフを表す隣接リストと各頂点の入次数を読み込む
def read_graph
  v, e = gets.split.map(&:to_i)
  adj_list = Array.new(v) { [] }
  in_degree = Array.new(v, 0)
  
  e.times do
    s, t = gets.split.map(&:to_i)
    adj_list[s] << t
    in_degree[t] += 1
  end
  
  [v, adj_list, in_degree]
end

# Kahn's algorithmによるトポロジカルソート
def topological_sort(v, adj_list, in_degree)
  result = []
  queue = []
  
  # 入次数が0の頂点をキューに追加
  v.times do |i|
    queue << i if in_degree[i] == 0
  end
  
  # キューが空になるまで処理を続ける
  while !queue.empty?
    u = queue.shift
    result << u
    
    # 隣接する頂点の入次数を減らし、0になったらキューに追加
    adj_list[u].each do |i|
      in_degree[i] -= 1
      queue << i if in_degree[i] == 0
    end
  end
  
  # 結果のサイズがvと等しくない場合は、グラフに閉路が存在する
  if result.size != v
    puts "Error: Graph contains a cycle"
    return []
  end
  
  result
end

# メイン処理
def main
  v, adj_list, in_degree = read_graph
  sorted_vertices = topological_sort(v, adj_list, in_degree)
  
  # 結果を出力
  sorted_vertices.each do |vertex|
    puts vertex
  end
end

# プログラムを実行
main
