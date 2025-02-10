class BinaryTreeNode
  attr_accessor :id, :left, :right

  def initialize(id)
    @id = id
    @left = -1
    @right = -1
  end
end

def preorder(node, nodes, result)
  return if node.nil?

  result << node.id
  preorder(nodes[node.left], nodes, result) if node.left != -1
  preorder(nodes[node.right], nodes, result) if node.right != -1
end

def inorder(node, nodes, result)
  return if node.nil?

  inorder(nodes[node.left], nodes, result) if node.left != -1
  result << node.id
  inorder(nodes[node.right], nodes, result) if node.right != -1
end

def postorder(node, nodes, result)
  return if node.nil?

  postorder(nodes[node.left], nodes, result) if node.left != -1
  postorder(nodes[node.right], nodes, result) if node.right != -1
  result << node.id
end

# 入力の読み込み
n = gets.to_i
nodes = Array.new(n) { |i| BinaryTreeNode.new(i) }

n.times do
  input = gets.split.map(&:to_i)
  id, left, right = input
  nodes[id].left = left
  nodes[id].right = right
end

# ルートノードを探す
root = nodes[0]

# 各トラバーサルの結果を計算
preorder_result = []
inorder_result = []
postorder_result = []

preorder(root, nodes, preorder_result)
inorder(root, nodes, inorder_result)
postorder(root, nodes, postorder_result)

# 結果を出力
puts "Preorder"
puts " " + preorder_result.join(" ")
puts "Inorder"
puts " " + inorder_result.join(" ")
puts "Postorder"
puts " " + postorder_result.join(" ")
