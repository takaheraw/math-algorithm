defmodule DynamicProgramming do
  # フィボナッチ数列を再帰的に計算する関数
  def fib_recursive(0), do: 0
  def fib_recursive(1), do: 1
  def fib_recursive(n), do: fib_recursive(n - 1) + fib_recursive(n - 2)

  # フィボナッチ数列を動的計画法を用いて計算する関数
  def fib_dynamic(n) when n <= 1, do: n
  def fib_dynamic(n) do
    fibs = Enum.reduce(0..n, [0, 1], fn _, [a, b] -> [b, a + b] end)
    hd(Enum.reverse(fibs))
  end
end

# テスト
IO.puts("フィボナッチ数列（再帰的）:")
for n <- 0..10 do
  IO.puts("fib_recursive(#{n}) = #{DynamicProgramming.fib_recursive(n)}")
end

IO.puts("\nフィボナッチ数列（動的計画法）:")
for n <- 0..10 do
  IO.puts("fib_dynamic(#{n}) = #{DynamicProgramming.fib_dynamic(n)}")
end
