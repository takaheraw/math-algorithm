defmodule MathUtils do
  # ユークリッドの互除法による最大公約数を求める関数
  def gcd(a, 0), do: a
  def gcd(a, b), do: gcd(b, rem(a, b))
end

IO.puts(MathUtils.gcd(48, 18)) # => 6
