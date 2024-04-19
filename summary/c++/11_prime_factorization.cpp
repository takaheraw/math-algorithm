#include <iostream>
#include <vector>

std::vector<int> prime_factors(int n) {
    std::vector<int> factors;
    for (int divisor = 2; n > 1; divisor++) {
        while (n % divisor == 0) {
            factors.push_back(divisor);
            n /= divisor;
        }
    }
    return factors;
}

int main() {
    int n;
    std::cout << "Input a number: ";
    std::cin >> n;
    std::vector<int> factors = prime_factors(n);
    std::cout << "Prime factors: ";
    for (size_t i = 0; i < factors.size(); i++) {
        std::cout << factors[i];
        if (i < factors.size() - 1) {
            std::cout << ", ";
        }
    }
    std::cout << std::endl;
    return 0;
}
