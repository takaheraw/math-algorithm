def selection_sort(arr)
  n = arr.length

  (0..n - 2).each do |i|
    min_value = arr[i]
    min_index = i

    (i + 1..n - 1).each do |j|
      if min_value > arr[j]
        min_value = arr[j]
        min_index = j
      end
    end

    arr[i], arr[min_index] = arr[min_index], arr[i]
  end

  arr
end

arr = gets.chomp.split.map(&:to_i)
sorted_arr = selection_sort(arr)

puts "#{sorted_arr}"
