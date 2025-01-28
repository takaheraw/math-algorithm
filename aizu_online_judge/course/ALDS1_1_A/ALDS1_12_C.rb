class PriorityQueue
  def initialize
    @heap = []
  end

  def push(distance, vertex)
    @heap << [distance, vertex]
    bubble_up(@heap.size - 1)
  end

  def pop
    return nil if @heap.empty?
    swap(0, @heap.size - 1)
    min = @heap.pop
    bubble_down(0)
    min
  end

  private

  def bubble_up(index)
    return if index == 0
    parent = (index - 1) / 2
    if @heap[index][0] < @heap[parent][0]
      swap(index, parent)
      bubble_up(parent)
    end
  end

  def bubble_down(index)
    left = 2 * index + 1
    right = 2 * index + 2
    smallest = index

    if left < @heap.size && @heap[left][0] < @heap[smallest][0]
      smallest = left
    end
    if right < @heap.size && @heap[right][0] < @heap[smallest][0]
      smallest = right
    end
    if smallest != index
      swap(index, smallest)
      bubble_down(smallest)
    end
  end

  def swap(i, j)
    @heap[i], @heap[j] = @heap[j], @heap[i]
  end
end

n = gets.to_i
adj = Array.new(n) { [] }

n.times do
  parts = gets.split.map(&:to_i)
  u = parts[0]
  k = parts[1]
  edges = parts[2..-1]
  (0...k).each do |i|
    v = edges[2 * i]
    c = edges[2 * i + 1]
    adj[u] << [v, c]
  end
end

inf = Float::INFINITY
dist = Array.new(n, inf)
dist[0] = 0
pq = PriorityQueue.new
pq.push(0, 0)
processed = Array.new(n, false)

while true
  current = pq.pop
  break unless current
  current_dist, u = current
  next if processed[u]
  processed[u] = true
  adj[u].each do |v, c|
    if dist[v] > current_dist + c
      dist[v] = current_dist + c
      pq.push(dist[v], v)
    end
  end
end

n.times do |i|
  puts "#{i} #{dist[i]}"
end
