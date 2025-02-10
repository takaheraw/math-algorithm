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

  # Delete a node with key k from the tree
  def delete(k)
    z = find_node(k)
    return if z.nil?

    if z.left.nil? && z.right.nil?
      # Case 1: z has no children
      transplant(z, nil)
    elsif z.left.nil?
      # Case 2: z has only right child
      transplant(z, z.right)
    elsif z.right.nil?
      # Case 2: z has only left child
      transplant(z, z.left)
    else
      # Case 3: z has two children
      y = minimum(z.right)
      if y.parent != z
        transplant(y, y.right)
        y.right = z.right
        y.right.parent = y
      end
      transplant(z, y)
      y.left = z.left
      y.left.parent = y
    end
  end

  # Helper method to find the node with key k
  def find_node(k)
    x = @root
    while x != nil
      if k == x.key
        return x
      elsif k < x.key
        x = x.left
      else
        x = x.right
      end
    end
    nil
  end

  # Helper method to replace one subtree with another
  def transplant(u, v)
    if u.parent.nil?
      @root = v
    elsif u == u.parent.left
      u.parent.left = v
    else
      u.parent.right = v
    end
    v.parent = u.parent if v != nil
  end

  # Helper method to find the minimum node in a subtree
  def minimum(node)
    while node.left != nil
      node = node.left
    end
    node
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
  elsif operation.start_with?('delete')
    key = operation.split.last.to_i
    bst.delete(key)
  elsif operation == 'print'
    bst.print_tree
  end
end
