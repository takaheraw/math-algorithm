package main

import "fmt"

func localSearch(arr []int) []int {
	n := len(arr)
	bestSolution := make([]int, n)
	copy(bestSolution, arr)
	bestCost := calculateCost(bestSolution)

	for {
		improved := false
		currentSolution := make([]int, n)
		copy(currentSolution, bestSolution)

		for i := 0; i < n; i++ {
			for j := i + 1; j < n; j++ {
				currentSolution[i], currentSolution[j] = currentSolution[j], currentSolution[i]
				currentCost := calculateCost(currentSolution)
				if currentCost < bestCost {
					copy(bestSolution, currentSolution)
					bestCost = currentCost
					improved = true
				}
				currentSolution[i], currentSolution[j] = currentSolution[j], currentSolution[i]
			}
		}

		if !improved {
			break
		}
	}

	return bestSolution
}

func calculateCost(arr []int) int {
	cost := 0
	for _, value := range arr {
		cost += value * value
	}
	return cost
}

// Example usage:
func main() {
	input := []int{10, 20, 30, 40, 50}
	optimalArrangement := localSearch(input)
	fmt.Println("Optimized Array:", optimalArrangement)
}
