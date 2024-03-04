package main

import (
	"fmt"
	"math"
)

func min(a, b int) int {
	if a < b {
		return a
	}
	return b
}

func main() {
	roomCount := 5
	pattern1 := []int{2, 4, 1, 3}
	pattern2 := []int{5, 3, 7}

	dp := make([]int, roomCount+1)
	dp[1] = 0
	dp[2] = pattern1[0]

	for i := 3; i <= roomCount; i++ {
		dp[i] = int(math.Min(float64(dp[i-1]+pattern1[i-2]), float64(dp[i-2]+pattern2[i-3])))
	}

	fmt.Println(dp[roomCount])
}
