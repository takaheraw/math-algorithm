# Ruby program to print each test case with a case number

case_number = 1

while (x = gets.to_i) != 0
  puts "Case #{case_number}: #{x}"
  case_number += 1
end
