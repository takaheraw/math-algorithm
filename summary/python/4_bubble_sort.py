def bubble_sort(arr):
    n = len(arr)
    for i in range(n):
        for j in range(0, n - i - 1):
            if arr[j] > arr[j + 1]:
                arr[j], arr[j + 1] = arr[j + 1], arr[j]
    return arr

# Example usage:
input_array = list(map(int, input().split()))
sorted_array = bubble_sort(input_array)
print("Sorted Array:", sorted_array)
