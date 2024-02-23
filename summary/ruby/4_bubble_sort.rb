def bubble_sort(arr)
  n = arr.length

  (0...n).each do |i|
    (0...n - i - 1).each do |j|
      arr[j], arr[j + 1] = arr[j + 1], arr[j] if arr[j] > arr[j + 1]
    end
  end

  arr
end

arr = gets.chomp.split.map(&:to_i)
sorted_arr = bubble_sort(arr)

puts "#{sorted_arr}"
