class TreeNode
  attr_accessor :id, :parent, :depth, :children

  def initialize(id)
    @id = id
    @parent = -1
    @depth = 0
    @children = []
  end
end

def set_depth(node, depth, nodes)
  node.depth = depth
  node.children.each do |child_id|
    set_depth(nodes[child_id], depth + 1, nodes)
  end
end

# 入力の読み込み
n = gets.to_i
nodes = Array.new(n) { |i| TreeNode.new(i) }

n.times do
  input = gets.split.map(&:to_i)
  id = input[0]
  k = input[1]
  children = input[2..]
  nodes[id].children = children
  children.each do |child_id|
    nodes[child_id].parent = id
  end
end

# ルートノードを探す
root = nodes.find { |node| node.parent == -1 }

# 深さを設定
set_depth(root, 0, nodes)

# 結果を出力
nodes.each do |node|
  type = if node.parent == -1
           "root"
         elsif node.children.empty?
           "leaf"
         else
           "internal node"
         end

  puts "node #{node.id}: parent = #{node.parent}, depth = #{node.depth}, #{type}, [#{node.children.join(", ")}]"
end
