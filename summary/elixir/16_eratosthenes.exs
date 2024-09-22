defmodule Eratosthenes do
  def sieve(max) do
    numbers = MapSet.new(2..max)
    do_sieve(numbers, 2, max)
  end

  defp do_sieve(numbers, current, max) when current > :math.sqrt(max) do
    MapSet.to_list(numbers)
  end

  defp do_sieve(numbers, current, max) do
    if MapSet.member?(numbers, current) do
      new_numbers = remove_multiples(numbers, current, max)
      do_sieve(new_numbers, current + 1, max)
    else
      do_sieve(numbers, current + 1, max)
    end
  end

  defp remove_multiples(numbers, prime, max) do
    Enum.reduce(prime * prime..max//prime, numbers, fn multiple, acc ->
      MapSet.delete(acc, multiple)
    end)
  end
end

# 使用例
max_number = 30
primes = Eratosthenes.sieve(max_number)
IO.puts "#{max_number}までの素数: #{Enum.join(primes, ", ")}"
