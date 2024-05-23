#include <vector>
#include <algorithm>
#include <iostream>

struct Item {
    int value;
    int weight;
};

// Function to compare two items according to value/weight ratio
bool compareItems(const Item &a, const Item &b) {
    double r1 = (double)a.value / a.weight;
    double r2 = (double)b.value / b.weight;
    return r1 > r2;
}

// Greedy algorithm for fractional knapsack problem
double fractionalKnapsack(int capacity, std::vector<Item> &items) {
    // Sorting items by decreasing value/weight ratio
    std::sort(items.begin(), items.end(), compareItems);

    int currentWeight = 0;
    double finalValue = 0.0;

    for (const Item &item : items) {
        if (currentWeight + item.weight <= capacity) {
            currentWeight += item.weight;
            finalValue += item.value;
        } else {
            int remain = capacity - currentWeight;
            finalValue += item.value * ((double)remain / item.weight);
            break;
        }
    }

    return finalValue;
}

int main() {
    std::vector<Item> items = {{60, 10}, {100, 20}, {120, 30}};
    int capacity = 50;

    std::cout << "Maximum value we can obtain = " 
              << fractionalKnapsack(capacity, items) << std::endl;
    return 0;
}
