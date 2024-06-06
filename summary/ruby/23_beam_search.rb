class BeamSearch

  attr_reader :start, :goal, :beam_width

  def initialize(start, goal, beam_width)
    @start = start
    @goal = goal
    @beam_width = beam_width
  end

  def search
    # 初期のビームを設定
    beam = [Node.new(start, nil, 0, heuristic(start))]
    
    until beam.empty?
      # ビームから展開するノードを取り出す
      new_beam = []
      
      beam.each do |node|
        # ゴールに到達したかを確認
        if node.state == goal
          return construct_path(node)
        end
        
        # 子ノードを生成
        children = expand(node)
        new_beam.concat(children)
      end

      # ビーム幅を超えないように最良のk個のノードだけを残す
      new_beam.sort_by!(&:estimated_cost)
      beam = new_beam.take(beam_width)
    end
    
    # ゴールが見つからなかった場合
    nil
  end

  private

  def expand(node)
    children = []
    # ここで状態遷移とコストの計算を行う
    # 遷移先の状態とコストを定義（例としての仮実装）
    transitions = [[1, 2], [2, 3], [3, 4]]  # 実際には問題に応じて定義

    transitions.each do |state, cost|
      new_cost = node.cost + cost
      estimated_cost = new_cost + heuristic(state)
      children << Node.new(state, node, new_cost, estimated_cost)
    end
    
    children
  end

  def heuristic(state)
    # ゴールまでの推定コストを計算するヒューリスティック関数
    # ここでは単純な差分を使う例を示す（実際には問題に応じて定義）
    (goal - state).abs
  end

  def construct_path(node)
    path = []
    while node
      path << node.state
      node = node.parent
    end
    path.reverse
  end

  class Node
    attr_reader :state, :parent, :cost, :estimated_cost

    def initialize(state, parent, cost, estimated_cost)
      @state = state
      @parent = parent
      @cost = cost
      @estimated_cost = estimated_cost
    end
  end
end

# 使用例
start = 0
goal = 10
beam_width = 2
beam_search = BeamSearch.new(start, goal, beam_width)
path = beam_search.search
puts "Path found: #{path.inspect}"
