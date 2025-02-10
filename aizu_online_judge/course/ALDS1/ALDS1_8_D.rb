class TreapNode
  attr_accessor :key, :priority, :left, :right
  
  def initialize(key, priority)
    @key = key
    @priority = priority
    @left = nil
    @right = nil
  end
end

class Treap
  def initialize
    @root = nil
  end

  def right_rotate(t)
    s = t.left
    t.left = s.right
    s.right = t
    return s
  end

  def left_rotate(t)
    s = t.right
    t.right = s.left
    s.left = t
    return s
  end

  def insert(t, key, priority)
    return TreapNode.new(key, priority) if t.nil?

    if key == t.key
      return t
    elsif key < t.key
      t.left = insert(t.left, key, priority)
      if t.priority < t.left.priority
        t = right_rotate(t)
      end
    else
      t.right = insert(t.right, key, priority)
      if t.priority < t.right.priority
        t = left_rotate(t)
      end
    end
    return t
  end

  def delete(t, key)
    return nil if t.nil?

    if key < t.key
      t.left = delete(t.left, key)
    elsif key > t.key
      t.right = delete(t.right, key)
    else
      return _delete(t)
    end
    return t
  end

  def _delete(t)
    if t.left.nil? && t.right.nil?
      return nil
    elsif t.left.nil?
      t = left_rotate(t)
    elsif t.right.nil?
      t = right_rotate(t)
    else
      if t.left.priority > t.right.priority
        t = right_rotate(t)
      else
        t = left_rotate(t)
      end
      return t # ここで再帰を呼び出さず、終了します
    end
    return t
  end

  def find(t, key)
    return false if t.nil?
    return true if key == t.key
    return find(t.left, key) if key < t.key
    return find(t.right, key) if key > t.key
  end

  def inorder(t, result = [])
    return result if t.nil?
    inorder(t.left, result)
    result << t.key
    inorder(t.right, result)
    return result
  end

  def preorder(t, result = [])
    return result if t.nil?
    result << t.key
    preorder(t.left, result)
    preorder(t.right, result)
    return result
  end

  def insert_key(key, priority)
    @root = insert(@root, key, priority)
  end

  def delete_key(key)
    @root = delete(@root, key)
  end

  def find_key(key)
    result = find(@root, key)
    puts result ? "yes" : "no"
  end

  def print_tree
    inorder_result = inorder(@root)
    preorder_result = preorder(@root)
    puts "#{inorder_result.join(' ')}"
    puts "#{preorder_result.join(' ')}"
  end
end

# 実行部分
treap = Treap.new
m = gets.to_i

m.times do
  operation = gets.split
  case operation[0]
  when 'insert'
    k, p = operation[1].to_i, operation[2].to_i
    treap.insert_key(k, p)
  when 'find'
    k = operation[1].to_i
    treap.find_key(k)
  when 'delete'
    k = operation[1].to_i
    treap.delete_key(k)
  when 'print'
    treap.print_tree
  end
end
