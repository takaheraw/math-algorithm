class MaxHeap
  def initialize
    @data = []
  end

  def push(x)
    @data << x
    sift_up(@data.size - 1)
  end

  def max
    @data.empty? ? nil : @data[0]
  end

  def pop
    return nil if @data.empty?
    swap(0, @data.size - 1)
    max_elem = @data.pop
    sift_down(0)
    max_elem
  end

  private

  def sift_up(i)
    while i > 0
      parent = (i - 1) / 2
      break if @data[parent] >= @data[i]
      swap(i, parent)
      i = parent
    end
  end

  def sift_down(i)
    n = @data.size
    while true
      left = 2 * i + 1
      right = 2 * i + 2
      largest = i

      if left < n && @data[left] > @data[largest]
        largest = left
      end
      if right < n && @data[right] > @data[largest]
        largest = right
      end
      break if largest == i
      swap(i, largest)
      i = largest
    end
  end

  def swap(i, j)
    @data[i], @data[j] = @data[j], @data[i]
  end
end

# Read input
n, q = gets.split.map(&:to_i)

# Create n priority queues
queues = Array.new(n) { MaxHeap.new }

q.times do
  query = gets.split.map(&:to_i)
  op = query[0]
  t = query[1]
  
  case op
  when 0  # insert
    x = query[2]
    queues[t].push(x)
  when 1  # getMax
    max_val = queues[t].max
    puts max_val if max_val != nil
  when 2  # deleteMax
    queues[t].pop
  end
end
