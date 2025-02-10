def calculate_flood_areas(input)
  stack = []
  areas = []

  input.chars.each_with_index do |char, index|
    if char == '\\'
      stack.push(index)
    elsif char == '/' && !stack.empty?
      start = stack.pop
      area = index - start
      while areas.any? && areas.last[:index] > start
        area += areas.pop[:area]
      end
      areas.push({ index: start, area: area })
    end
  end

  total_area = areas.sum { |a| a[:area] }
  individual_areas = areas.map { |a| a[:area] }

  puts total_area
  puts "#{individual_areas.size} #{individual_areas.join(' ')}"
end

# 標準入力から文字列を読み取る
input = gets.strip
calculate_flood_areas(input)
