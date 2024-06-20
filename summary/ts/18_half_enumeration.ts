function halfEnumeration(arr: number[], targetSum: number): number {
  const n = arr.length;
  const half = Math.floor(n / 2);

  const firstHalfSubsets: { [key: number]: number } = {};
  for (let i = 0; i < (1 << half); i++) {
    let sum = 0;
    for (let j = 0; j < half; j++) {
      if (i & (1 << j)) {
        sum += arr[j];
      }
    }
    firstHalfSubsets[sum] = (firstHalfSubsets[sum] || 0) + 1;
  }

  const secondHalfSubsets: { [key: number]: number } = {};
  for (let i = 0; i < (1 << (n - half)); i++) {
    let sum = 0;
    for (let j = 0; j < (n - half); j++) {
      if (i & (1 << j)) {
        sum += arr[half + j];
      }
    }
    secondHalfSubsets[sum] = (secondHalfSubsets[sum] || 0) + 1;
  }

  let count = 0;
  for (const [sum1, count1] of Object.entries(firstHalfSubsets)) {
    const needed = targetSum - parseInt(sum1);
    count += count1 * (secondHalfSubsets[needed] || 0);
  }

  return count;
}

// Example usage:
const inputArray = [1, 2, 3, 4, 5, 6, 7, 8];
const targetSum = 10;
const result = halfEnumeration(inputArray, targetSum);
console.log(`Number of ways to achieve sum ${targetSum}: ${result}`);
