#include <iostream>
#include <cmath>

bool isPrime(int n) {
    if (n <= 1) return false;
    if (n == 2) return true;
    for (int i = 2; i <= std::sqrt(n); ++i) {
        if (n % i == 0) return false;
    }
    return true;
}

int main() {
    int numbers[] = {2, 3, 4, 5, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 12};
    for (int number : numbers) {
        std::cout << "Is " << number << " a prime number? " << (isPrime(number) ? "Yes" : "No") << std::endl;
    }
    return 0;
}
