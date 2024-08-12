def sieve_of_eratosthenes(max_num):
    primes = [True] * (max_num + 1)
    primes[0] = primes[1] = False

    for i in range(2, int(max_num**0.5) + 1):
        if primes[i]:
            for j in range(i*i, max_num + 1, i):
                primes[j] = False

    return [num for num in range(2, max_num + 1) if primes[num]]

# Example usage
if __name__ == "__main__":
    max_number = 30
    prime_numbers = sieve_of_eratosthenes(max_number)
    print(f"Prime numbers up to {max_number}: {prime_numbers}")
