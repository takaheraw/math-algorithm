function shakutori(arr: number[], k: number): number {
  const n = arr.length;
  let res = 0;
  let right = 0;
  let sum = 0;

  for (let left = 0; left < n; left++) {
    while (right < n && sum + arr[right] <= k) {
      sum += arr[right];
      right++;
    }

    res += right - left;

    if (right == left) {
      right++;
    } else {
      sum -= arr[left];
    }
  }

  return res;
}

// Example usage:
const inputArray = [1, 2, 3, 4, 5]; // Example input array
const k = 5; // Example k value
const result = shakutori(inputArray, k);
console.log(`Number of subarrays with sum <= ${k}: ${result}`);
