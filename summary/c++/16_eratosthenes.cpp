#include <iostream>
#include <vector>

std::vector<int> sieve_of_eratosthenes(int max) {
    std::vector<bool> is_prime(max + 1, true);
    std::vector<int> primes;
    is_prime[0] = is_prime[1] = false; // 0 and 1 are not prime numbers

    for (int num = 2; num * num <= max; ++num) {
        if (is_prime[num]) {
            for (int multiple = num * num; multiple <= max; multiple += num) {
                is_prime[multiple] = false;
            }
        }
    }

    for (int num = 2; num <= max; ++num) {
        if (is_prime[num]) {
            primes.push_back(num);
        }
    }

    return primes;
}

int main() {
    int max_number = 30;
    std::vector<int> primes = sieve_of_eratosthenes(max_number);
    std::cout << "Primes up to " << max_number << ": ";
    for (int prime : primes) {
        std::cout << prime << " ";
    }
    std::cout << std::endl;
    return 0;
}
