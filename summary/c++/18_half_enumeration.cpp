#include <iostream>
#include <vector>
#include <algorithm>

// 部分集合和を生成する関数
void generateSubsetSums(const std::vector<int>& nums, std::vector<int>& subsetSums) {
    int n = nums.size();
    int subsetCount = 1 << n;  // 2^n 個の部分集合
    subsetSums.resize(subsetCount);

    for (int i = 0; i < subsetCount; ++i) {
        int sum = 0;
        for (int j = 0; j < n; ++j) {
            if (i & (1 << j)) {
                sum += nums[j];
            }
        }
        subsetSums[i] = sum;
    }
}

// 半分全列挙アルゴリズム
bool meetInTheMiddle(const std::vector<int>& nums, int target) {
    int n = nums.size();
    int mid = n / 2;

    std::vector<int> leftPart(nums.begin(), nums.begin() + mid);
    std::vector<int> rightPart(nums.begin() + mid, nums.end());

    std::vector<int> leftSums, rightSums;
    generateSubsetSums(leftPart, leftSums);
    generateSubsetSums(rightPart, rightSums);

    // 右側の部分集合和をソート
    std::sort(rightSums.begin(), rightSums.end());

    // 左側の部分集合和に対して二分探索を行う
    for (int sum : leftSums) {
        if (std::binary_search(rightSums.begin(), rightSums.end(), target - sum)) {
            return true;
        }
    }

    return false;
}

int main() {
    int arr[] = {1, 3, 9, 2, 7};
    std::vector<int> nums(arr, arr + sizeof(arr) / sizeof(arr[0]));
    int target = 10;

    if (meetInTheMiddle(nums, target)) {
        std::cout << "Target sum exists in the subset." << std::endl;
    } else {
        std::cout << "Target sum does not exist in the subset." << std::endl;
    }

    return 0;
}
