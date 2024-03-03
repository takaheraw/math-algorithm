package main

import "fmt"

func gcd(a, b int) int {
	for a >= 1 && b >= 1 {
		if a >= b {
			a = a % b
		} else {
			b = b % a
		}
	}
	if a >= 1 {
		return a
	} else {
		return b
	}
}

func lcd(a, b int) int {
	return (a * b) / gcd(a, b)
}

func main() {
	var a, b int
	fmt.Scanf("%d %d", &a, &b)
	fmt.Printf("%d\n", lcd(a, b))
}
