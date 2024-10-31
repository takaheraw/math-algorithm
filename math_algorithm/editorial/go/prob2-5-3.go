package main

import (
	"fmt"
)

func main() {
	// 入力
	var n int
	fmt.Scanln(&n)

	// 答えの計算
	answer := 1
	for i := 1; i <= n; i++ {
		answer *= i
	}

	// 出力
	fmt.Println(answer)
}
