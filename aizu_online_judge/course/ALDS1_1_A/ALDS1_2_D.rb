def insertion_sort(array, n, g, cnt)
  (g...n).each do |i|
    v = array[i]
    j = i - g
    while j >= 0 && array[j] > v
      array[j + g] = array[j]
      j -= g
      cnt[0] += 1
    end
    array[j + g] = v
  end
end

def shell_sort(array, n)
  cnt = [0]
  g_values = []
  g = 1

  # Generate G values using the sequence 1, 4, 13, 40, ...
  while g <= n
    g_values.unshift(g)
    g = 3 * g + 1
  end

  # Perform insertion sort for each g
  g_values.each do |g|
    insertion_sort(array, n, g, cnt)
  end

  [g_values, cnt[0]]
end

# Read input
n = gets.to_i
array = Array.new(n) { gets.to_i }

# Execute Shell Sort
g_values, cnt = shell_sort(array, n)

# Output results
puts g_values.size
puts g_values.join(" ")
puts cnt
array.each { |a| puts a }
