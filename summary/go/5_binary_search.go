package main

import "fmt"

func binarySearch(arr []int, target int) int {
	left := 0
	right := len(arr) - 1

	for left <= right {
		mid := (left + right) / 2

		if arr[mid] == target {
			return mid
		} else if arr[mid] < target {
			left = mid + 1
		} else {
			right = mid - 1
		}
	}
	return -1
}

func main() {
	// テスト用の配列
	arr := []int{1, 3, 5, 7, 9, 11, 13, 15}

	// 二分探索を実行
	targetIndex := binarySearch(arr, 11)

	if targetIndex != -1 {
		fmt.Printf("要素 %d は配列の %d 番目にあります。\n", 11, targetIndex)
	} else {
		fmt.Println("要素 %d は配列内に見つかりませんでした。", 11)
	}
}
