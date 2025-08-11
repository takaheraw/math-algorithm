n = gets.to_i
s = gets.chomp

result = ""

s.each_char do |char|
  result += char
  
  if result.length >= 2
    last_two = result[-2..-1]  # 末尾の2文字を取得
    
    case last_two
    when "jj"
      result = result[0...-2] + "JJ"  # 末尾2文字を"JJ"に置換
    when "oo"
      result = result[0...-2] + "OO"  # 末尾2文字を"OO"に置換
    when "ii"
      result = result[0...-2] + "II"  # 末尾2文字を"II"に置換
    end
  end
end

puts result
