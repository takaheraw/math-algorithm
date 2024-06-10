package main

import (
	"fmt"
)

func halfEnumeration(arr []int, targetSum int) int {
	n := len(arr)
	half := n / 2

	firstHalfSubsets := make(map[int]int)
	for i := 0; i < (1 << half); i++ {
		sum := 0
		for j := 0; j < half; j++ {
			if i&(1<<j) != 0 {
				sum += arr[j]
			}
		}
		firstHalfSubsets[sum]++
	}

	secondHalfSubsets := make(map[int]int)
	for i := 0; i < (1 << (n - half)); i++ {
		sum := 0
		for j := 0; j < (n - half); j++ {
			if i&(1<<(j)) != 0 {
				sum += arr[half+j]
			}
		}
		secondHalfSubsets[sum]++
	}

	count := 0
	for sum1, count1 := range firstHalfSubsets {
		needed := targetSum - sum1
		count += count1 * (secondHalfSubsets[needed])
	}

	return count
}

func main() {
	var n, targetSum int
	fmt.Scan(&n)
	arr := make([]int, n)
	for i := range arr {
		fmt.Scan(&arr[i])
	}
	fmt.Scan(&targetSum)

	result := halfEnumeration(arr, targetSum)
	fmt.Printf("Number of ways to achieve sum %d: %d\n", targetSum, result)
}
