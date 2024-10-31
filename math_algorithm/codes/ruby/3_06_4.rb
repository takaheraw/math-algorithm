def gcd(a, b)
  if b == 0
    return a  # ベースケース
  end

  gcd(b, a % b)
end

a, b = gets.chomp.split.map(&:to_i)
puts gcd(a, b)
