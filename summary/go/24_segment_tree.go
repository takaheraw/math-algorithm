package main

import (
	"fmt"
)

// セグメント木構造体
type SegmentTree struct {
	data []int // セグメント木のデータ
	n    int   // データの個数
}

// 新しいセグメント木を作成
func NewSegmentTree(n int) *SegmentTree {
	// データの個数が2のべき乗になるまで倍にする
	segtree := &SegmentTree{
		data: make([]int, 2*n-1),
		n:    n,
	}
	for i := n; i < 2*n-1; i++ {
		segtree.data[i] = 0 // 初期値を0に設定
	}
	return segtree
}

// 区間[l, r]の和を取得
func (segtree *SegmentTree) query(l, r, idx, a, b int) int {
	// 範囲外の場合は0を返す
	if b <= l || r <= a {
		return 0
	}

	// 区間が完全に含まれる場合は、データの値を返す
	if l <= a && b <= r {
		return segtree.data[idx]
	}

	// 部分的に含まれる場合は、子の値を再帰的に取得して合計する
	v1 := segtree.query(l, r, idx*2+1, a, (a+b)/2)
	v2 := segtree.query(l, r, idx*2+2, (a+b)/2, b)
	return v1 + v2
}

// 区間[l, r]の和を取得（main関数から呼び出す関数）
func Query(segtree *SegmentTree, l, r int) int {
	return segtree.query(l, r, 0, 0, segtree.n)
}

// 単一要素の更新
func (segtree *SegmentTree) update(i, val int) {
	// 更新対象のインデックスまで再帰的に値を更新
	idx := 0
	for i > 0 {
		segtree.data[idx] += val
		idx = idx*2 + (i & 1)
		i >>= 1
	}
	segtree.data[idx] += val
}

// main関数
func main() {
	// データの配列
	data := []int{1, 3, 2, 5, 4, 7}

	// セグメント木を作成
	n := len(data)
	segtree := NewSegmentTree(n)

	// データをセグメント木に挿入
	for i, v := range data {
		segtree.update(i, v)
	}

	// 区間[1, 3]の和を取得
	sum := Query(segtree, 1, 3)
	fmt.Println("区間[1, 3]の和:", sum) // 6 (1 + 3 + 2)

	// 要素2を10に更新
	segtree.update(2, 10)

	// 区間[0, 4]の和を取得
	sum = Query(segtree, 0, 4)
	fmt.Println("区間[0, 4]の和:", sum) // 22 (1 + 10 + 2 + 5 + 4)
}
