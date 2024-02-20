package main

import (
	"fmt"
)

// 最大公約数を返す関数
func gcd(a, b int) int {
	for a >= 1 && b >= 1 {
		if a < b {
			b %= a // A < B の場合、大きい方 B を書き換える
		} else {
			a %= b // A >= B の場合、大きい方 A を書き換える
		}
	}
	if a >= 1 {
		return a
	} else {
		return b
	}
}

// 最小公倍数を返す関数
func lcm(a, b int) int {
	return a / gcd(a, b) * b
}

func main() {
	// 入力
	var n int
	fmt.Scan(&n)
	a := make([]int, n)
	for i := 0; i < n; i++ {
		fmt.Scan(&a[i])
	}

	// 答えを求める
	r := lcm(a[0], a[1])
	for i := 2; i < n; i++ {
		r = lcm(r, a[i])
	}

	// 出力
	fmt.Println(r)
}
