def func(n)
  if n == 1
    return 1  # このような場合分けすべきケースを「ベースケース」といいます
  end

  func(n - 1) * n
end

n = gets.to_i
puts func(n)
