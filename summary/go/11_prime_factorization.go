package main

import (
	"fmt"
)

func primeFactors(n int) []int {
	var factors []int
	divisor := 2

	for n > 1 {
		for n%divisor == 0 {
			factors = append(factors, divisor)
			n /= divisor
		}
		divisor++
	}

	return factors
}

func main() {
	var n int
	fmt.Print("整数を入力してください: ")
	fmt.Scan(&n)

	fmt.Printf("素因数分解結果: %v\n", primeFactors(n))
}
