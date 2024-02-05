def func(n)
  if n <= 0
    return 1  # ベースケース
  end

  func(n - 1) * n
end

n = gets.to_i
puts func(n)
