package main

import "fmt"

func sieveOfEratosthenes(max int) []int {
	numbers := make([]bool, max+1)
	for i := 2; i <= max; i++ {
		numbers[i] = true
	}

	p := 2
	for p*p <= max {
		if numbers[p] {
			for i := p * p; i <= max; i += p {
				numbers[i] = false
			}
		}
		p++
	}

	var primes []int
	for i := 2; i <= max; i++ {
		if numbers[i] {
			primes = append(primes, i)
		}
	}

	return primes
}

func main() {
	maxNumber := 30
	primes := sieveOfEratosthenes(maxNumber)
	fmt.Println("Primes up to", maxNumber, ":", primes)
}
