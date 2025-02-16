# Define a custom queue class that supports O(1) enqueue, front, and dequeue operations.
class MyQueue
  def initialize
    @data = []
    @head = 0
  end

  def enqueue(x)
    @data << x
  end

  def front
    return nil if empty?
    @data[@head]
  end

  def dequeue
    return if empty?
    @head += 1
    # Optional: Clean up memory if too many elements have been dequeued.
    if @head > 100 && @head * 2 >= @data.size
      @data = @data[@head..-1]
      @head = 0
    end
  end

  def empty?
    @head >= @data.size
  end
end

# Read input values
n, q = gets.split.map(&:to_i)

# Initialize n queues.
queues = Array.new(n) { MyQueue.new }

q.times do
  query = gets.split.map(&:to_i)
  op = query[0]
  t = query[1]
  case op
  when 0
    # enqueue operation: query is [0, t, x]
    x = query[2]
    queues[t].enqueue(x)
  when 1
    # front operation: if the queue is not empty, print the front element.
    front_val = queues[t].front
    puts front_val if front_val != nil
  when 2
    # dequeue operation: remove the front element if exists.
    queues[t].dequeue
  end
end
