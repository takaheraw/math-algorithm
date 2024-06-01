def half_enumeration(arr, target_sum)
  n = arr.length
  half = n / 2
  
  first_half_subsets = {}
  (0...(1 << half)).each do |i|
    sum = 0
    (0...half).each do |j|
      sum += arr[j] if i & (1 << j) != 0
    end
    first_half_subsets[sum] = (first_half_subsets[sum] || 0) + 1
  end
  
  second_half_subsets = {}
  (0...(1 << (n - half))).each do |i|
    sum = 0
    (0...(n - half)).each do |j|
      sum += arr[half + j] if i & (1 << j) != 0
    end
    second_half_subsets[sum] = (second_half_subsets[sum] || 0) + 1
  end
  
  count = 0
  first_half_subsets.each do |sum1, count1|
    needed = target_sum - sum1
    count += count1 * (second_half_subsets[needed] || 0)
  end
  
  count
end

# Example usage:
input_array = gets.chomp.split.map(&:to_i)
target_sum = gets.to_i
result = half_enumeration(input_array, target_sum)
puts "Number of ways to achieve sum #{target_sum}: #{result}"
