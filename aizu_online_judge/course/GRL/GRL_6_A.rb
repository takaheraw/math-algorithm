# frozen_string_literal: true

# Edge構造体: 行き先(to)、容量(cap)、逆辺のインデックス(rev)を保持
Edge = Struct.new(:to, :cap, :rev)

# 最大フローを計算するクラス (Dinic法)
class MaxFlow
  INF = Float::INFINITY # 無限大を表す定数

  # 初期化
  # @param v [Integer] グラフの頂点数
  def initialize(v)
    @v = v # 頂点数
    @graph = Array.new(v) { [] } # グラフ本体（隣接リスト）
    @level = Array.new(v)         # BFSで使用する各頂点のレベル（始点からの距離）
    @iter = Array.new(v)          # DFSで使用する各頂点のイテレータ（どこまで辺を探索したか）
  end

  # 辺を追加するメソッド
  # fromからtoへ容量capの辺を追加する
  # 同時にtoからfromへ容量0の逆辺も追加する
  # @param from [Integer] 辺の始点
  # @param to [Integer] 辺の終点
  # @param cap [Integer] 辺の容量
  def add_edge(from, to, cap)
    # from -> to の辺
    @graph[from] << Edge.new(to, cap, @graph[to].size)
    # to -> from の逆辺（容量は初期状態で0）
    @graph[to] << Edge.new(from, 0, @graph[from].size - 1)
  end

  # BFS (幅優先探索)
  # 始点sから各頂点への最短距離（レベル）を計算する
  # @param s [Integer] 始点
  # @param t [Integer] 終点
  # @return [void]
  private def bfs(s, t)
    @level.fill(-1) # 全頂点のレベルを未到達(-1)で初期化
    queue = []
    @level[s] = 0   # 始点のレベルを0に設定
    queue << s       # キューに始点を追加

    while !queue.empty?
      v = queue.shift # キューから頂点を取り出す
      # 取り出した頂点vから出る各辺について処理
      @graph[v].each do |edge|
        # 容量があり、かつまだ訪れていない頂点edge.toについて
        if edge.cap > 0 && @level[edge.to] < 0
          @level[edge.to] = @level[v] + 1 # edge.toのレベルを確定
          queue << edge.to                # キューにedge.toを追加
        end
      end
    end
  end

  # DFS (深さ優先探索)
  # 始点sから終点tへ流量fのフローを流す増加パスを探す
  # @param v [Integer] 現在の頂点
  # @param t [Integer] 終点
  # @param f [Integer] 流そうとするフローの量
  # @return [Integer] 実際に流せたフローの量 (流せなければ0)
  private def dfs(v, t, f)
    return f if v == t # 終点に到達したら、現在の流量fを返す

    # @iter[v]以降の辺を探索 (Dinic法の最適化)
    while @iter[v] < @graph[v].size
      edge = @graph[v][@iter[v]]
      # 容量があり、かつレベルが1つ深い頂点へ進む
      if edge.cap > 0 && @level[v] < @level[edge.to]
        # 再帰的にDFSを呼び出し、流せるフローdを計算
        # 流せる量は、現在の流量fと辺の容量edge.capの小さい方
        d = dfs(edge.to, t, [f, edge.cap].min)
        if d > 0
          # フローを流す処理
          edge.cap -= d # 辺の容量を減らす
          # 逆辺の容量を増やす
          @graph[edge.to][edge.rev].cap += d
          return d # 流せた量を返す
        end
      end
      # この辺ではフローを流せなかったので、次の辺へ進む
      @iter[v] += 1
    end
    # この頂点vからはフローを流せなかった
    return 0
  end

  # 最大フロー計算
  # 始点sから終点tへの最大フローを求める
  # @param s [Integer] 始点 (source)
  # @param t [Integer] 終点 (sink)
  # @return [Integer] 最大フローの値
  def max_flow(s, t)
    flow = 0 # 最大フローの合計値
    loop do
      # BFSを実行して、sからtへのパスが存在するか（レベルグラフが作成できるか）確認
      bfs(s, t)
      # tに到達不可能なら、これ以上フローは流せないので終了
      break if @level[t] < 0

      # DFSで使うイテレータをリセット
      @iter.fill(0)
      # DFSで増加パスを探し、フローを流す
      loop do
        # sからtへ無限大のフローを流そうと試みる
        f = dfs(s, t, INF)
        # 増加パスが見つからなければ(f=0)、このレベルでのフロー探索は終了
        break if f == 0
        # 見つかったフローを合計に加算
        flow += f
      end
    end
    # 計算された最大フローを返す
    flow
  end
end

# --- 入力処理 ---
# 頂点数Vと辺数Eを読み込む
v, e = gets.split.map(&:to_i)

# MaxFlowクラスのインスタンスを作成
mf = MaxFlow.new(v)

# E本の辺の情報を読み込み、グラフに追加
e.times do
  # 辺の始点u, 終点v_node, 容量cを読み込む
  u, v_node, c = gets.split.map(&:to_i)
  # グラフに辺を追加
  mf.add_edge(u, v_node, c)
end

# --- 最大フロー計算と出力 ---
# 始点(source)は0, 終点(sink)はV-1とする
source = 0
sink = v - 1
# 最大フローを計算して出力
puts mf.max_flow(source, sink)
