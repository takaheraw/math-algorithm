void main() {
  // 入力の整数集合と目標値
  List<int> nums = [1, 2, 3, 4, 5];
  int target = 9;

  // 部分集合和問題を解く関数を呼び出す
  bool result = subsetSum(nums, target);

  // 結果を出力
  if (result) {
    print('Yes, there is a subset with sum equal to $target.');
  } else {
    print('No, there is no subset with sum equal to $target.');
  }
}

bool subsetSum(List<int> nums, int target) {
  int n = nums.length;

  // DP配列の初期化
  // dp[mask]は、maskで表される部分集合の和を表す
  List<bool> dp = List<bool>.filled(1 << n, false);
  dp[0] = true;  // 空の部分集合の和は0

  for (int mask = 0; mask < (1 << n); mask++) {
    if (dp[mask]) {
      for (int i = 0; i < n; i++) {
        if ((mask & (1 << i)) == 0) {  // i番目の要素が部分集合に含まれていない場合
          int newMask = mask | (1 << i);
          int newSum = subsetSumFromMask(nums, newMask);
          if (newSum == target) {
            return true;
          }
          dp[newMask] = true;
        }
      }
    }
  }

  return false;
}

// マスクに基づいて部分集合の和を計算する関数
int subsetSumFromMask(List<int> nums, int mask) {
  int sum = 0;
  for (int i = 0; i < nums.length; i++) {
    if ((mask & (1 << i)) != 0) {
      sum += nums[i];
    }
  }
  return sum;
}
