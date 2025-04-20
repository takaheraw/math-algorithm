class MinimumCostArborescence
  INF = Float::INFINITY

  def initialize(n, edges, root)
    @n = n        # 頂点数
    @edges = edges # 辺のリスト [src, dst, weight]
    @root = root  # 根の頂点番号
  end

  def solve
    # Edmonds' アルゴリズムの実装
    incoming_edges = Array.new(@n) { [] }
    
    # 各頂点に入る辺を記録
    @edges.each_with_index do |(src, dst, weight), edge_idx|
      incoming_edges[dst] << [src, weight, edge_idx]
    end
    
    # 各頂点に入る最小の辺を選択
    min_edges = Array.new(@n) { [-1, INF, -1] }  # [src, weight, edge_idx]
    
    incoming_edges.each_with_index do |edges, v|
      next if v == @root  # 根には入る辺を選ばない
      
      edges.each do |src, weight, edge_idx|
        if weight < min_edges[v][1]
          min_edges[v] = [src, weight, edge_idx]
        end
      end
    end
    
    # 閉路を検出
    visited = Array.new(@n, false)
    in_current_path = Array.new(@n, false)
    cycles = []
    
    # 各頂点からDFSして閉路を検出
    (0...@n).each do |v|
      next if v == @root || visited[v]
      
      # 現在のパスをクリア
      in_current_path.fill(false)
      
      # DFSで閉路を検出
      cycle = detect_cycle(v, visited, in_current_path, min_edges)
      cycles << cycle if cycle
    end
    
    # 閉路がなければ、選択した辺の重みの合計を返す
    if cycles.empty?
      return min_edges.sum { |_, weight, _| weight == INF ? 0 : weight }
    else
      # 閉路があれば、閉路を縮約して再帰的に解く
      return contract_and_solve(cycles, min_edges)
    end
  end
  
  private
  
  # DFSで閉路を検出する
  def detect_cycle(v, visited, in_current_path, min_edges)
    return nil if visited[v]
    
    visited[v] = true
    in_current_path[v] = true
    
    # 最小の入辺に沿って移動
    u = min_edges[v][0]
    if u != -1 && !visited[u]
      cycle = detect_cycle(u, visited, in_current_path, min_edges)
      return cycle if cycle
    elsif u != -1 && in_current_path[u]
      # 閉路を見つけた
      cycle = [u]
      current = v
      while current != u
        cycle << current
        current = min_edges[current][0]
      end
      return cycle
    end
    
    in_current_path[v] = false
    return nil
  end
  
  # 閉路を縮約して再帰的に解く
  def contract_and_solve(cycles, min_edges)
    # 最初の閉路のみを処理
    cycle = cycles[0]
    
    # 新しいグラフを作成
    new_n = @n - cycle.size + 1
    cycle_node = @n - cycle.size  # 新しい縮約ノードのID
    
    # 縮約後の辺を作成
    new_edges = []
    node_map = Array.new(@n, -1)
    
    # サイクル内の頂点のマッピングを作成
    cycle.each { |v| node_map[v] = cycle_node }
    
    # サイクル外の頂点のマッピング
    non_cycle_counter = 0
    (0...@n).each do |v|
      next if cycle.include?(v)
      node_map[v] = non_cycle_counter
      non_cycle_counter += 1
    end
    
    # 新しいグラフの辺を作成
    @edges.each do |(src, dst, weight)|
      new_src = node_map[src]
      new_dst = node_map[dst]
      
      # サイクル内の頂点間の辺は無視
      next if new_src == cycle_node && new_dst == cycle_node
      
      # サイクルに入る辺は調整（最小の重みを選ぶ）
      if new_dst == cycle_node
        # サイクル内の各頂点への辺の中から最小のものを選ぶ
        min_w = INF
        min_cycle_dst = -1
        
        cycle.each do |c_dst|
          if dst == c_dst
            w = weight - min_edges[c_dst][1]  # 重みを調整
            if w < min_w
              min_w = w
              min_cycle_dst = c_dst
            end
          end
        end
        
        if min_cycle_dst != -1
          new_edges << [new_src, new_dst, min_w]
        end
      elsif new_src != cycle_node || new_dst != cycle_node
        # サイクル以外の辺はそのまま追加
        new_edges << [new_src, new_dst, weight]
      end
    end
    
    # 新しい根を決定
    new_root = node_map[@root]
    
    # 再帰的に解く
    contracted_mca = MinimumCostArborescence.new(new_n, new_edges, new_root)
    contracted_cost = contracted_mca.solve
    
    # サイクル内の辺のコストを加算
    cycle_cost = cycle.sum { |v| min_edges[v][1] == INF ? 0 : min_edges[v][1] }
    
    # 合計コストを返す
    return contracted_cost + cycle_cost
  end
end

# 入力の処理
n, m, r = gets.strip.split.map(&:to_i)
edges = []

m.times do
  s, t, w = gets.strip.split.map(&:to_i)
  edges << [s, t, w]
end

# 最小コスト根付き全域木を求める
mca = MinimumCostArborescence.new(n, edges, r)
result = mca.solve

puts result
