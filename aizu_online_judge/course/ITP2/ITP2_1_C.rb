class Node
  attr_accessor :val, :prev, :nxt
  def initialize(val)
    @val = val
    @prev = nil
    @nxt = nil
  end
end

# Read all input tokens at once for efficiency.
input = STDIN.read.split
q = input.shift.to_i

# Create two sentinel nodes: head and tail.
head = Node.new(nil)
tail = Node.new(nil)
head.nxt = tail
tail.prev = head

# The cursor initially points to END (represented by tail).
cursor = tail

i = 0
q.times do
  op = input[i]; i += 1
  case op
  when "0"  # insert(x)
    x = input[i].to_i; i += 1
    new_node = Node.new(x)
    # Insert new_node before the element pointed by cursor.
    new_node.prev = cursor.prev
    new_node.nxt = cursor
    cursor.prev.nxt = new_node
    cursor.prev = new_node
    # Cursor now points to the inserted node.
    cursor = new_node
  when "1"  # move(d)
    d = input[i].to_i; i += 1
    if d > 0
      d.times { cursor = cursor.nxt }
    else  # d is negative, move left.
      (-d).times { cursor = cursor.prev }
    end
  when "2"  # erase()
    # Erase the node pointed by the cursor (cursor is not tail).
    node_to_remove = cursor
    # After erasing, cursor should point to the next element.
    cursor = node_to_remove.nxt
    # Unlink node_to_remove from the list.
    node_to_remove.prev.nxt = node_to_remove.nxt
    node_to_remove.nxt.prev = node_to_remove.prev
  end
end

# After all operations, output all elements in the list (excluding the tail sentinel).
node = head.nxt
result = []
while node != tail
  result << node.val.to_s
  node = node.nxt
end

puts result.join("\n")
