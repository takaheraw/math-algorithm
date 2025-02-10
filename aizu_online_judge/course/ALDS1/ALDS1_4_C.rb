n = gets.to_i

dictionary = {}

n.times do
  input = gets.split
  command, str = input[0], input[1]

  if command == "insert"
    dictionary[str] = true
  elsif command == "find"
    puts dictionary[str] ? "yes" : "no"
  end
end
