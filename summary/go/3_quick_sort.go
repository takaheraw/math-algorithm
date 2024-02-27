package main

import (
	"fmt"
	"math/rand"
)

func quickSort(arr []int) []int {
	if len(arr) <= 1 {
		return arr
	}

	pivot := arr[rand.Intn(len(arr))]
	var less, eq, greater []int
	for _, v := range arr {
		switch {
		case v < pivot:
			less = append(less, v)
		case v == pivot:
			eq = append(eq, v)
		case v > pivot:
			greater = append(greater, v)
		}
	}

	less = quickSort(less)
	greater = quickSort(greater)

	return append(append(less, eq...), greater...)
}

func main() {
	var n int
	fmt.Scan(&n)
	arr := make([]int, n)
	for i := 0; i < n; i++ {
		fmt.Scan(&arr[i])
	}

	sortedArr := quickSort(arr)
	fmt.Println(sortedArr)
}
