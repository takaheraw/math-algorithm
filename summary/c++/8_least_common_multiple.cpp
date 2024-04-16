#include <iostream>
#include <cmath> // For std::abs

// Function to calculate the Greatest Common Divisor (GCD)
int gcd(int a, int b) {
    while (b != 0) {
        int temp = b;
        b = a % b;
        a = temp;
    }
    return a;
}

// Function to calculate the Least Common Multiple (LCM)
int lcm(int a, int b) {
    return std::abs(a * b) / gcd(a, b);
}

int main() {
    int a, b;
    std::cout << "Enter two integers: ";
    std::cin >> a >> b;
    std::cout << "The Least Common Multiple of " << a << " and " << b << " is " << lcm(a, b) << std::endl;
    return 0;
}
