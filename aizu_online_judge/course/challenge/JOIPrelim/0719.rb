q = gets.to_i

book_stack = []

q.times do
  action = gets.chomp
  
  if action == "READ"
    read_book = book_stack.pop
    puts read_book
  else
    book_stack.push(action)
  end
end
