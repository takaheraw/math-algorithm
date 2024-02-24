def gcd(a, b)
  while a >= 1 && b >= 1
    if a >= b
      a = a % b
    else
      b = b % a
    end
  end

  a >= 1 ? a : b
end

def lcd(a, b)
  (a * b) / gcd(a, b)
end

a, b = gets.chomp.split.map(&:to_i)
puts "#{lcd(a, b)}"
