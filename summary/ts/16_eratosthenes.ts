function sieveOfEratosthenes(max: number): number[] {
    let numbers: number[] = Array.from({ length: max - 1 }, (_, i) => i + 2);
    let primes: number[] = [];

    while (numbers.length > 0) {
        const prime = numbers.shift()!;
        primes.push(prime);
        numbers = numbers.filter(num => num % prime !== 0);
    }

    return primes;
}

// Example usage:
const maxNumber: number = 30;
const primes: number[] = sieveOfEratosthenes(maxNumber);
console.log(`Primes up to ${maxNumber}: ${primes.join(', ')}`);
