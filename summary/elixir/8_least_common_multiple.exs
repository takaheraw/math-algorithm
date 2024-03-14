defmodule MathUtils do
  def gcd(a, 0), do: a
  def gcd(a, b), do: gcd(b, rem(a, b))

  # 最小公倍数を計算する関数
  def lcm(a, b) when a == 0 or b == 0, do: 0
  def lcm(a, b), do: abs(a * b) / gcd(a, b)
end

# テスト
IO.puts(MathUtils.lcm(12, 18))  # => 36
IO.puts(MathUtils.lcm(5, 7))     # => 35
