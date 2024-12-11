# Ruby program to toggle the case of letters in a string

# Read the input string
input = gets.chomp

# Toggle the case of each character
output = input.chars.map do |char|
  if char =~ /[a-z]/
    char.upcase
  elsif char =~ /[A-Z]/
    char.downcase
  else
    char
  end
end.join

# Print the converted string
puts output
