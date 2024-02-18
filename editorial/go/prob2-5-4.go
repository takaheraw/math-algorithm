package main

import (
	"fmt"
	"math"
)

func isPrime(n int) bool {
	if n <= 1 {
		return false
	}

	for i := 2; i <= int(math.Sqrt(float64(n))); i++ {
		if n%i == 0 {
			return false
		}
	}

	return true
}

func main() {
	// 入力
	var n int
	fmt.Scanln(&n)
	a := []int{}

	// 素数の検出
	for i := 2; i <= n; i++ {
		if isPrime(i) {
			a = append(a, i)
		}
	}

	// 出力
	for _, num := range a {
		fmt.Printf("%d ", num)
	}
	fmt.Println()
}
