def quick_sort(arr)
  return arr if arr.length <= 1

  pivot   = arr.sample
  less    = arr.select { |v| v < pivot }
  eq      = arr.select { |v| v == pivot }
  greater = arr.select { |v| v > pivot }

  quick_sort(less) + eq + quick_sort(greater)
end

arr = gets.chomp.split.map(&:to_i)
sorted_arr = quick_sort(arr)

puts "#{sorted_arr}"
