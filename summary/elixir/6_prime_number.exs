defmodule Prime do
  # 素数かどうかを判定する関数
  def is_prime(n) when n <= 1, do: false
  def is_prime(2), do: true
  def is_prime(n) do
    # nが2より大きい奇数で割り切れるかを確認
    Enum.all?(2..trunc(:math.sqrt(n)), fn x -> rem(n, x) != 0 end)
  end
end

# テスト
IO.puts Prime.is_prime(7) # true
IO.puts Prime.is_prime(12) # false
IO.puts Prime.is_prime(23) # true
