#include <iostream>
#include <vector>
using namespace std;

int main() {
    vector<int> visitors = {62, 65, 41, 13, 20, 11, 18, 44, 53, 12, 18, 17, 14, 10, 39};
    vector<int> accumulates(visitors.size() + 1, 0);
    for (size_t i = 1; i <= visitors.size(); ++i) {
        accumulates[i] = accumulates[i - 1] + visitors[i - 1];
    }
    vector<pair<int, int>> targets = {{2, 4}, {4, 13}};
    for (auto [l, r] : targets) {
        cout << l << "日目から" << r << "日目までの来場者数: ";
        cout << accumulates[r] - accumulates[l - 1] << endl;
    }
    return 0;
}
