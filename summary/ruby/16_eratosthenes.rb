def sieve_of_eratosthenes(max)
  numbers = (2..max).to_a
  primes = []

  while numbers.any?
    prime = numbers.shift
    primes << prime
    numbers.reject! { |num| num % prime == 0 }
  end

  primes
end

# Example usage:
max_number = 30
primes = sieve_of_eratosthenes(max_number)
puts "Primes up to #{max_number}: #{primes.join(', ')}"
