#include <iostream>
#include <vector>

int shakutori(const std::vector<int>& arr, int k) {
    int n = arr.size();
    int res = 0;
    int right = 0;
    int sum = 0;

    for (int left = 0; left < n; ++left) {
        while (right < n && sum + arr[right] <= k) {
            sum += arr[right];
            ++right;
        }

        res += right - left;

        if (right == left) {
            ++right;
        } else {
            sum -= arr[left];
        }
    }

    return res;
}

int main() {
    int n, k;
    std::cin >> n >> k;
    std::vector<int> arr(n);
    for (int i = 0; i < n; ++i) {
        std::cin >> arr[i];
    }

    int result = shakutori(arr, k);
    std::cout << "Number of subarrays with sum <= " << k << ": " << result << std::endl;

    return 0;
}
