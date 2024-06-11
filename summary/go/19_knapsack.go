package main

import (
	"fmt"
)

func knapsack(weights []int, values []int, capacity int) int {
	n := len(weights)
	dp := make([][]int, n+1)
	for i := range dp {
		dp[i] = make([]int, capacity+1)
	}

	for i := 1; i <= n; i++ {
		for w := 1; w <= capacity; w++ {
			if weights[i-1] <= w {
				dp[i][w] = max(dp[i-1][w], values[i-1]+dp[i-1][w-weights[i-1]])
			} else {
				dp[i][w] = dp[i-1][w]
			}
		}
	}
	return dp[n][capacity]
}

func max(a, b int) int {
	if a > b {
		return a
	}
	return b
}

func main() {
	var n, capacity int
	fmt.Scan(&n, &capacity)
	weights := make([]int, n)
	values := make([]int, n)

	for i := 0; i < n; i++ {
		fmt.Scan(&weights[i], &values[i])
	}

	result := knapsack(weights, values, capacity)
	fmt.Printf("Maximum value that can be accommodated: %d\n", result)
}
