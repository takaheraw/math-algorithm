class PriorityQueue
  def initialize
    @heap = []
  end

  def insert(key)
    @heap << key
    sift_up(@heap.size - 1)
  end

  def extract_max
    return nil if @heap.empty?

    max = @heap[0]
    @heap[0] = @heap.pop
    sift_down(0) unless @heap.empty?

    max
  end

  private

  def sift_up(index)
    parent = (index - 1) / 2
    return if index <= 0 || @heap[parent] >= @heap[index]

    @heap[parent], @heap[index] = @heap[index], @heap[parent]
    sift_up(parent)
  end

  def sift_down(index)
    left = 2 * index + 1
    right = 2 * index + 2
    largest = index

    largest = left if left < @heap.size && @heap[left] > @heap[largest]
    largest = right if right < @heap.size && @heap[right] > @heap[largest]

    if largest != index
      @heap[index], @heap[largest] = @heap[largest], @heap[index]
      sift_down(largest)
    end
  end
end

# メイン処理
pq = PriorityQueue.new

loop do
  command = gets.chomp.split
  case command[0]
  when "insert"
    pq.insert(command[1].to_i)
  when "extract"
    puts pq.extract_max
  when "end"
    break
  end
end
