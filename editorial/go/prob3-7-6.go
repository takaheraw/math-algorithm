package main

import (
	"fmt"
)

func max(a, b int) int {
	if a > b {
		return a
	}
	return b
}

func main() {
	var n int
	fmt.Scan(&n)

	a := make([]int, n)
	for i := 0; i < n; i++ {
		fmt.Scan(&a[i])
	}

	dp1 := make([]int, n+1)
	dp2 := make([]int, n+1)
	dp1[0] = 0
	dp2[0] = 0

	for i := 1; i <= n; i++ {
		dp1[i] = dp2[i-1] + a[i-1]
		dp2[i] = max(dp1[i-1], dp2[i-1])
	}

	answer := max(dp1[n], dp2[n])
	fmt.Println(answer)
}
