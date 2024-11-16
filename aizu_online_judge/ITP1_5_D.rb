# Ruby program to mimic the given C++ code without using goto statements

def call(n)
  (1..n).each do |i|
    if i % 3 == 0
      print " #{i}"
      next
    end

    x = i
    include_three = false

    while x > 0
      if x % 10 == 3
        include_three = true
        break
      end
      x /= 10
    end

    print " #{i}" if include_three
  end
  puts
end

# Reading input and calling the function
n = gets.to_i
call(n)
