class BinaryTreeNode
  attr_accessor :id, :parent, :left, :right, :depth, :height

  def initialize(id)
    @id = id
    @parent = -1
    @left = -1
    @right = -1
    @depth = 0
    @height = 0
  end
end

def set_depth_and_height(node, depth, nodes)
  return -1 if node.nil?

  node.depth = depth

  left_height = set_depth_and_height(nodes[node.left], depth + 1, nodes) if node.left != -1
  right_height = set_depth_and_height(nodes[node.right], depth + 1, nodes) if node.right != -1

  node.height = [left_height || -1, right_height || -1].max + 1
end

# 入力の読み込み
n = gets.to_i
nodes = Array.new(n) { |i| BinaryTreeNode.new(i) }

n.times do
  input = gets.split.map(&:to_i)
  id, left, right = input
  nodes[id].left = left
  nodes[id].right = right
  nodes[left].parent = id if left != -1
  nodes[right].parent = id if right != -1
end

# ルートノードを探す
root = nodes.find { |node| node.parent == -1 }

# 深さと高さを設定
set_depth_and_height(root, 0, nodes)

# 結果を出力
nodes.each do |node|
  sibling = if node.parent == -1
              -1
            else
              parent = nodes[node.parent]
              parent.left == node.id ? parent.right : parent.left
            end

  degree = [node.left, node.right].count { |child| child != -1 }

  type = if node.parent == -1
           "root"
         elsif degree == 0
           "leaf"
         else
           "internal node"
         end

  puts "node #{node.id}: parent = #{node.parent}, sibling = #{sibling}, degree = #{degree}, depth = #{node.depth}, height = #{node.height}, #{type}"
end
