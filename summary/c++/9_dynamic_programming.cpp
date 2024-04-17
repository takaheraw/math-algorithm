#include <iostream>
#include <vector>
using namespace std;

int main() {
    int room_count = 5;
    vector<int> pattern1 = {2, 4, 1, 3};
    vector<int> pattern2 = {5, 3, 7};

    vector<int> dp(room_count + 1);
    dp[1] = 0;
    dp[2] = pattern1[0];
    for(int i = 3; i <= room_count; i++) {
        dp[i] = min(dp[i - 1] + pattern1[i - 2], dp[i - 2] + pattern2[i - 3]);
    }

    cout << dp[room_count] << endl;

    return 0;
}
