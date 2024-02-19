package main

import (
	"fmt"
	"math"
)

func main() {
	var n int
	fmt.Scan(&n)

	answer := make([]int, 0)
	limit := int(math.Sqrt(float64(n)))
	for i := 2; i <= limit; i++ {
		for n%i == 0 {
			n /= i
			answer = append(answer, i)
		}
	}

	if n >= 2 {
		answer = append(answer, n)
	}

	for i, v := range answer {
		if i > 0 {
			fmt.Print(" ")
		}
		fmt.Print(v)
	}
	fmt.Println()
}
