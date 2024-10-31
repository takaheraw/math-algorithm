package main

import (
	"fmt"
)

func mergeSort(arr []int) []int {
	// 長さが 1 の場合、すでにソートされているので何もしない
	if len(arr) <= 1 {
		return arr
	}

	// 2 つに分割した後、小さい配列をソート
	mid := len(arr) / 2
	leftHalf := mergeSort(arr[:mid])
	rightHalf := mergeSort(arr[mid:])

	// 以下が Merge 操作となります。
	return merge(leftHalf, rightHalf)
}

func merge(left, right []int) []int {
	result := make([]int, 0)
	for len(left) > 0 && len(right) > 0 {
		if left[0] <= right[0] {
			result = append(result, left[0])
			left = left[1:]
		} else {
			result = append(result, right[0])
			right = right[1:]
		}
	}
	result = append(result, left...)
	result = append(result, right...)
	return result
}

func main() {
	var n int
	fmt.Scan(&n)
	a := make([]int, n)
	for i := 0; i < n; i++ {
		fmt.Scan(&a[i])
	}

	// マージソート → 答えの出力
	answer := mergeSort(a)
	for _, val := range answer {
		fmt.Printf("%d ", val)
	}
	fmt.Println()
}
