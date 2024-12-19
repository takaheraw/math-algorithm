def evaluate_rpn(expression)
  stack = []

  expression.split.each do |token|
    case token
    when "+"
      b = stack.pop
      a = stack.pop
      stack.push(a + b)
    when "-"
      b = stack.pop
      a = stack.pop
      stack.push(a - b)
    when "*"
      b = stack.pop
      a = stack.pop
      stack.push(a * b)
    else
      stack.push(token.to_i)
    end
  end

  stack.pop
end

# Read input
expression = gets.strip

# Evaluate RPN and output result
puts evaluate_rpn(expression)
