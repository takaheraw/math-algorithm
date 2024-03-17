defmodule PrimeFactors do
  def prime_factors(n) do
    prime_factors(n, 2, [])
  end

  defp prime_factors(1, _, factors), do: Enum.reverse(factors)

  defp prime_factors(n, divisor, factors) when rem(n, divisor) == 0 do
    prime_factors(div(n, divisor), divisor, [divisor | factors])
  end

  defp prime_factors(n, divisor, factors) do
    prime_factors(n, divisor + 1, factors)
  end
end

n = IO.gets("Input a number: ") |> String.trim() |> String.to_integer()
factors = PrimeFactors.prime_factors(n)
IO.puts("Prime factors: #{Enum.join(factors, ", ")}")
