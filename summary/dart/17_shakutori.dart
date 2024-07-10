void main() {
  List<int> nums = [1, 2, 3, 4, 2, 5, 1, 2, 3];
  int target = 7;
  List<int> result = longestSubarrayWithSum(nums, target);
  print(result); // 出力例: [3, 4]
}

List<int> longestSubarrayWithSum(List<int> nums, int target) {
  int left = 0;
  int right = 0;
  int currentSum = 0;
  int maxLength = 0;
  int startIndex = 0;

  while (right < nums.length) {
    currentSum += nums[right];
    while (currentSum > target && left <= right) {
      currentSum -= nums[left];
      left++;
    }

    if (currentSum == target && (right - left + 1) > maxLength) {
      maxLength = right - left + 1;
      startIndex = left;
    }

    right++;
  }

  return nums.sublist(startIndex, startIndex + maxLength);
}
