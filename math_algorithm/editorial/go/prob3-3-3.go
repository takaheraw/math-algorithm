package main

import (
	"fmt"
)

func factorial(num int) int {
	if num == 0 {
		return 1
	}
	return num * factorial(num-1)
}

func main() {
	var n, r int
	fmt.Scan(&n, &r)

	factN := factorial(n)
	factR := factorial(r)
	factNR := factorial(n - r)

	result := factN / (factR * factNR)

	fmt.Println(result)
}
