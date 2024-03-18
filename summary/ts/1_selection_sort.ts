function selectionSort(arr: number[]): number[] {
  const n = arr.length;

  for (let i = 0; i < n - 1; i++) {
    // 未ソート部分から最小値を探す
    let minIdx = i;
    for (let j = i + 1; j < n; j++) {
      if (arr[j] < arr[minIdx]) {
        minIdx = j;
      }
    }

    // 未ソート部分の最小値と未ソート部分の先頭を交換
    const temp = arr[i];
    arr[i] = arr[minIdx];
    arr[minIdx] = temp;
  }

  return arr;
}

// 使用例
const unsortedArr = [5, 3, 8, 4, 2];
const sortedArr = selectionSort(unsortedArr);
console.log(sortedArr); // [2, 3, 4, 5, 8]
