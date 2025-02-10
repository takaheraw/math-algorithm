# Merge function with count of comparisons
def merge(arr, left, mid, right)
  n1 = mid - left
  n2 = right - mid
  l = arr[left..mid-1]
  r = arr[mid..right-1]
  
  l.push(Float::INFINITY) # Sentinel value
  r.push(Float::INFINITY) # Sentinel value
  
  i = 0
  j = 0
  comparisons = 0
  
  for k in left..right-1
    comparisons += 1
    if l[i] <= r[j]
      arr[k] = l[i]
      i += 1
    else
      arr[k] = r[j]
      j += 1
    end
  end
  
  comparisons
end

# Merge Sort function
def merge_sort(arr, left, right)
  return 0 if left + 1 >= right

  mid = (left + right) / 2
  comparisons = 0
  comparisons += merge_sort(arr, left, mid)
  comparisons += merge_sort(arr, mid, right)
  comparisons += merge(arr, left, mid, right)

  comparisons
end

# Input reading
n = gets.to_i
arr = gets.split.map(&:to_i)

# Call Merge Sort and get the comparisons count
comparisons = merge_sort(arr, 0, n)

# Output the sorted array and the number of comparisons
puts arr.join(" ")
puts comparisons
