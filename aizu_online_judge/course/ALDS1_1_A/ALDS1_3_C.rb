class DoublyLinkedList
  class Node
    attr_accessor :key, :prev, :next

    def initialize(key)
      @key = key
      @prev = nil
      @next = nil
    end
  end

  def initialize
    @head = nil
    @tail = nil
  end

  def insert(x)
    new_node = Node.new(x)
    if @head.nil?
      @head = @tail = new_node
    else
      new_node.next = @head
      @head.prev = new_node
      @head = new_node
    end
  end

  def delete(x)
    current = @head
    while current
      if current.key == x
        if current == @head
          deleteFirst
        elsif current == @tail
          deleteLast
        else
          current.prev.next = current.next
          current.next.prev = current.prev
        end
        break
      end
      current = current.next
    end
  end

  def deleteFirst
    return unless @head

    if @head == @tail
      @head = @tail = nil
    else
      @head = @head.next
      @head.prev = nil
    end
  end

  def deleteLast
    return unless @tail

    if @head == @tail
      @head = @tail = nil
    else
      @tail = @tail.prev
      @tail.next = nil
    end
  end

  def print_list
    result = []
    current = @head
    while current
      result << current.key
      current = current.next
    end
    puts result.join(' ')
  end
end

# Read input
n = gets.to_i
list = DoublyLinkedList.new

n.times do
  command = gets.split
  case command[0]
  when 'insert'
    list.insert(command[1].to_i)
  when 'delete'
    list.delete(command[1].to_i)
  when 'deleteFirst'
    list.deleteFirst
  when 'deleteLast'
    list.deleteLast
  end
end

# Print the final state of the list
list.print_list
