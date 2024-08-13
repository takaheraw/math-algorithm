def shakutori(arr, k):
    n = len(arr)
    res = 0
    right = 0
    sum = 0

    for left in range(n):
        while right < n and sum + arr[right] <= k:
            sum += arr[right]
            right += 1

        res += right - left

        if right == left:
            right += 1
        else:
            sum -= arr[left]

    return res

# Example usage:
input_array = list(map(int, input().split()))
k = int(input())
result = shakutori(input_array, k)
print(f"Number of subarrays with sum <= {k}: {result}")
