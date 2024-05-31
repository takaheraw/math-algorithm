def shakutori(arr, k)
  n = arr.length
  res = 0
  right = 0
  sum = 0

  (0...n).each do |left|
    while right < n && sum + arr[right] <= k
      sum += arr[right]
      right += 1
    end

    res += right - left

    if right == left
      right += 1
    else
      sum -= arr[left]
    end
  end

  res
end

# Example usage:
input_array = gets.chomp.split.map(&:to_i)
k = gets.to_i
result = shakutori(input_array, k)
puts "Number of subarrays with sum <= #{k}: #{result}"
