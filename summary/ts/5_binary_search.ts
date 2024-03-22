function binarySearch(arr: number[], target: number): number {
  let left = 0;
  let right = arr.length - 1;

  while (left <= right) {
    const mid = Math.floor((left + right) / 2);

    if (arr[mid] === target) {
      return mid; // ターゲットが見つかった場合はインデックスを返す
    } else if (arr[mid] < target) {
      left = mid + 1; // ターゲットがmidより大きい場合は右側を探索
    } else {
      right = mid - 1; // ターゲットがmidより小さい場合は左側を探索
    }
  }

  return -1; // ターゲットが見つからなかった場合は-1を返す
}

// 使用例
const sortedArray = [1, 3, 5, 7, 9];
console.log(binarySearch(sortedArray, 5)); // 2
console.log(binarySearch(sortedArray, 6)); // -1
