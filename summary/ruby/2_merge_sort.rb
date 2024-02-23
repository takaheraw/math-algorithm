def merge_sort(arr)
  return arr if arr.length <= 1

  mid   = arr.length / 2
  left  = merge_sort(arr[0...mid])
  right = merge_sort(arr[mid..])

  merge(left, right)
end

def merge(left, right)
  result = []

  until left.empty? || right.empty?
    result << if left.first <= right.first
                left.shift
              else
                right.shift
              end
  end

  result + left + right
end

arr = gets.chomp.split.map(&:to_i)
sorted_arr = merge_sort(arr)

puts "#{sorted_arr}"
