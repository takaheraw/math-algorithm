class HeapSort
  def initialize(array)
    @array = array
    @heap_size = array.size
  end

  def sort
    build_max_heap
    (@heap_size - 1).downto(1) do |i|
      @array[0], @array[i] = @array[i], @array[0]
      @heap_size -= 1
      max_heapify(0)
    end
    @array
  end

  private

  def build_max_heap
    (@heap_size / 2 - 1).downto(0) do |i|
      max_heapify(i)
    end
  end

  def max_heapify(i)
    left = 2 * i + 1
    right = 2 * i + 2
    largest = i

    largest = left if left < @heap_size && @array[left] > @array[largest]
    largest = right if right < @heap_size && @array[right] > @array[largest]

    if largest != i
      @array[i], @array[largest] = @array[largest], @array[i]
      max_heapify(largest)
    end
  end
end

# 入力の読み込み
n = gets.to_i
array = gets.split.map(&:to_i)

# 最大ヒープを構築
heap_sort = HeapSort.new(array)
result = heap_sort.sort.reverse

# 出力
puts result.join(" ")
