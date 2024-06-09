package main

import "fmt"

func shakutori(arr []int, k int) int {
	n := len(arr)
	res := 0
	right := 0
	sum := 0

	for left := 0; left < n; left++ {
		for right < n && sum+arr[right] <= k {
			sum += arr[right]
			right++
		}

		res += right - left

		if right == left {
			right++
		} else {
			sum -= arr[left]
		}
	}

	return res
}

// Example usage:
func main() {
	inputArray := []int{1, 2, 3, 4, 5}
	k := 5
	result := shakutori(inputArray, k)
	fmt.Printf("Number of subarrays with sum <= %d: %d\n", k, result)
}
