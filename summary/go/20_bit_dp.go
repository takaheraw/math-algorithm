package main

import (
	"fmt"
)

func bitDP(weights []int, values []int, capacity int) int {
	n := len(weights)
	dp := make([]int, 1<<n)

	for s := 1; s < (1 << n); s++ {
		for i := 0; i < n; i++ {
			if s&(1<<i) != 0 {
				prevSubset := s ^ (1 << i)
				if weights[i] <= capacity {
					dp[s] = max(dp[s], dp[prevSubset]+values[i])
				}
			}
		}
	}

	return dp[(1<<n)-1]
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

	result := bitDP(weights, values, capacity)
	fmt.Printf("Maximum value using bit DP: %d\n", result)
}
