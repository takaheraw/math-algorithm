class PriorityQueue
  def initialize
    @heap = []
  end

  def push(element)
    @heap << element
    bubble_up(@heap.size - 1)
  end

  def pop
    return nil if @heap.empty?
    swap(0, @heap.size - 1)
    element = @heap.pop
    bubble_down(0)
    element
  end

  def empty?
    @heap.empty?
  end

  private

  def bubble_up(index)
    parent = (index - 1) / 2
    return if index <= 0
    if @heap[index][0] < @heap[parent][0]
      swap(index, parent)
      bubble_up(parent)
    end
  end

  def bubble_down(index)
    left = 2 * index + 1
    right = 2 * index + 2
    smallest = index

    smallest = left if left < @heap.size && @heap[left][0] < @heap[smallest][0]
    smallest = right if right < @heap.size && @heap[right][0] < @heap[smallest][0]
    if smallest != index
      swap(index, smallest)
      bubble_down(smallest)
    end
  end

  def swap(i, j)
    @heap[i], @heap[j] = @heap[j], @heap[i]
  end
end

def heuristic(state)
  sum = 0
  state.each_with_index do |num, index|
    next if num == 0
    correct_pos = num - 1
    current_row = index / 4
    current_col = index % 4
    target_row = correct_pos / 4
    target_col = correct_pos % 4
    sum += (current_row - target_row).abs + (current_col - target_col).abs
  end
  sum
end

# Read input
input = 4.times.map { gets.split.map(&:to_i) }
initial = input.flatten
target = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 0]

if initial == target
  puts 0
  exit
end

pq = PriorityQueue.new
visited = {}

initial_heuristic = heuristic(initial)
pq.push([initial_heuristic + 0, 0, initial])
visited_key = initial.join(',')
visited[visited_key] = 0

until pq.empty?
  current = pq.pop
  priority, steps, state = current
  state_key = state.join(',')

  next if visited[state_key] && steps > visited[state_key]

  if state == target
    puts steps
    exit
  end

  zero_index = state.index(0)

  possible_moves = []
  # Up
  possible_moves << zero_index - 4 if zero_index >= 4
  # Down
  possible_moves << zero_index + 4 if zero_index < 12
  # Left
  possible_moves << zero_index - 1 if zero_index % 4 != 0
  # Right
  possible_moves << zero_index + 1 if (zero_index + 1) % 4 != 0

  possible_moves.each do |new_index|
    new_state = state.dup
    new_state[zero_index], new_state[new_index] = new_state[new_index], new_state[zero_index]
    new_steps = steps + 1
    new_key = new_state.join(',')

    if new_state == target
      puts new_steps
      exit
    end

    if visited.key?(new_key)
      next if visited[new_key] <= new_steps
    end

    h = heuristic(new_state)
    priority = new_steps + h

    pq.push([priority, new_steps, new_state])
    visited[new_key] = new_steps
  end
end
