import heapq

class Node:
    def __init__(self, state, cost, path):
        self.state = state
        self.cost = cost
        self.path = path

    def __lt__(self, other):
        return self.cost < other.cost

def beam_search(start, goal, successors, beam_width):
    # 初期状態
    initial_node = Node(start, 0, [start])
    beam = [initial_node]
    
    while beam:
        # ビームの中で目標に到達したノードがあるか確認
        for node in beam:
            if node.state == goal:
                return node.path
        
        # 次のレベルの候補ノードを格納するリスト
        next_beam = []
        
        for node in beam:
            # 現在のノードから遷移可能な次の状態を取得
            for (next_state, cost) in successors(node.state):
                new_cost = node.cost + cost
                new_path = node.path + [next_state]
                new_node = Node(next_state, new_cost, new_path)
                heapq.heappush(next_beam, new_node)
        
        # 次のレベルのビームをビーム幅に制限して選択
        beam = heapq.nsmallest(beam_width, next_beam)
    
    return None  # ゴールが見つからなかった場合

# サンプルの使用例
def sample_successors(state):
    successors_dict = {
        'A': [('B', 1), ('C', 2)],
        'B': [('D', 4), ('E', 2)],
        'C': [('F', 2)],
        'D': [],
        'E': [('G', 1)],
        'F': [('G', 5)],
        'G': []
    }
    return successors_dict.get(state, [])

start_state = 'A'
goal_state = 'G'
beam_width = 2

result = beam_search(start_state, goal_state, sample_successors, beam_width)
print("Found path:", result)
