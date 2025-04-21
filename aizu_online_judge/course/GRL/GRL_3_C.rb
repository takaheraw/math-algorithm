#!/usr/bin/env ruby

# 強連結成分を見つけるためのTarjanのアルゴリズム実装
class StronglyConnectedComponents
  def initialize(n)
    @n = n                  # ノード数
    @graph = Array.new(n) { [] } # グラフの隣接リスト
    @ids = Array.new(n, -1)      # 各ノードの訪問順ID
    @low_links = Array.new(n)    # 各ノードが到達できる最小のID
    @on_stack = Array.new(n, false) # スタック内にノードがあるかどうか
    @stack = []                  # DFSスタック
    @id = 0                      # 次に割り当てるID
    @components = []             # 検出された強連結成分
  end

  # エッジを追加する
  def add_edge(from, to)
    @graph[from] << to
  end

  # すべての強連結成分を見つける
  def find_sccs
    @n.times do |node|
      dfs(node) if @ids[node] == -1
    end
    @components
  end

  # 同じ強連結成分内にあるかどうかをチェック
  def same_component?(u, v)
    # 各ノードがどの強連結成分に属しているかのマッピングを作成
    component_map = {}
    @components.each_with_index do |component, i|
      component.each do |node|
        component_map[node] = i
      end
    end
    
    # 同じ強連結成分に属しているかチェック
    component_map[u] == component_map[v]
  end

  private

  # 深さ優先探索を実行
  def dfs(node)
    @ids[node] = @low_links[node] = @id
    @id += 1
    @stack << node
    @on_stack[node] = true

    # 隣接ノードを探索
    @graph[node].each do |neighbor|
      if @ids[neighbor] == -1
        # まだ訪問していないノード
        dfs(neighbor)
        @low_links[node] = [@low_links[node], @low_links[neighbor]].min
      elsif @on_stack[neighbor]
        # すでにスタック上にあるノード（バックエッジ）
        @low_links[node] = [@low_links[node], @ids[neighbor]].min
      end
    end

    # 強連結成分を検出
    if @low_links[node] == @ids[node]
      component = []
      loop do
        w = @stack.pop
        @on_stack[w] = false
        component << w
        break if w == node
      end
      @components << component
    end
  end
end

# 入力を読み込む
v, e = gets.split.map(&:to_i)
scc = StronglyConnectedComponents.new(v)

# エッジを追加
e.times do
  s, t = gets.split.map(&:to_i)
  scc.add_edge(s, t)
end

# 強連結成分を見つける
scc.find_sccs

# クエリを処理
q = gets.to_i
results = []

q.times do
  u, v = gets.split.map(&:to_i)
  # 同じ強連結成分内にあるかどうかをチェック
  results << (scc.same_component?(u, v) ? 1 : 0)
end

# 結果を出力
puts results
