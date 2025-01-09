class TreeNode
  attr_accessor :key, :left, :right, :parent

  def initialize(key)
    @key = key
    @left = nil
    @right = nil
    @parent = nil
  end
end

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  # Insert a new node with key k into the tree
  def insert(k)
    z = TreeNode.new(k)
    y = nil
    x = @root

    while x != nil
      y = x
      if z.key < x.key
        x = x.left
      else
        x = x.right
      end
    end

    z.parent = y

    if y == nil
      @root = z
    elsif z.key < y.key
      y.left = z
    else
      y.right = z
    end
  end

  # Find if a node with key k exists in the tree
  def find(k)
    x = @root
    while x != nil
      if k == x.key
        return true
      elsif k < x.key
        x = x.left
      else
        x = x.right
      end
    end
    return false
  end

  # Inorder traversal
  def inorder(node, result = [])
    return result if node.nil?
    
    inorder(node.left, result)
    result << node.key
    inorder(node.right, result)
  end

  # Preorder traversal
  def preorder(node, result = [])
    return result if node.nil?

    result << node.key
    preorder(node.left, result)
    preorder(node.right, result)
  end

  # Print inorder and preorder traversals
  def print_tree
    inorder_result = inorder(@root).join(' ')
    preorder_result = preorder(@root).join(' ')
    puts "#{inorder_result}\n#{preorder_result}"
  end
end

# Input and processing
bst = BinarySearchTree.new
m = gets.to_i

m.times do
  operation = gets.strip
  if operation.start_with?('insert')
    key = operation.split.last.to_i
    bst.insert(key)
  elsif operation.start_with?('find')
    key = operation.split.last.to_i
    puts bst.find(key) ? "yes" : "no"
  elsif operation == 'print'
    bst.print_tree
  end
end
