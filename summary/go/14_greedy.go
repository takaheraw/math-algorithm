package main

import (
	"fmt"
	"sort"
)

type Item struct {
	Value  float64
	Weight float64
	Ratio  float64
	Index  int
}

func greedyAlgorithm(items []Item, capacity float64) (float64, []int) {
	sort.Slice(items, func(i, j int) bool {
		return items[i].Ratio > items[j].Ratio
	})

	totalValue := 0.0
	totalWeight := 0.0
	selectedItems := []int{}

	for _, item := range items {
		if totalWeight+item.Weight <= capacity {
			selectedItems = append(selectedItems, item.Index)
			totalValue += item.Value
			totalWeight += item.Weight
		}
	}

	return totalValue, selectedItems
}

// Example usage
func main() {
	items := []Item{
		{Value: 60, Weight: 10, Ratio: 6, Index: 1},
		{Value: 100, Weight: 20, Ratio: 5, Index: 2},
		{Value: 120, Weight: 30, Ratio: 4, Index: 3},
	}
	capacity := 50.0

	totalValue, selectedItems := greedyAlgorithm(items, capacity)
	fmt.Printf("Total value: %.2f\n", totalValue)
	fmt.Println("Items selected:", selectedItems)
}
