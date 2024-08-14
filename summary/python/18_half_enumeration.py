def half_enumeration(arr, target_sum):
    n = len(arr)
    half = n // 2
    
    first_half_subsets = {}
    for i in range(1 << half):
        sum = 0
        for j in range(half):
            if i & (1 << j):
                sum += arr[j]
        first_half_subsets[sum] = first_half_subsets.get(sum, 0) + 1
    
    second_half_subsets = {}
    for i in range(1 << (n - half)):
        sum = 0
        for j in range(n - half):
            if i & (1 << j):
                sum += arr[half + j]
        second_half_subsets[sum] = second_half_subsets.get(sum, 0) + 1
    
    count = 0
    for sum1, count1 in first_half_subsets.items():
        needed = target_sum - sum1
        count += count1 * second_half_subsets.get(needed, 0)
    
    return count

# Example usage:
input_array = list(map(int, input().split()))
target_sum = int(input())
result = half_enumeration(input_array, target_sum)
print(f"Number of ways to achieve sum {target_sum}: {result}")
