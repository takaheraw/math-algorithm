n, w, d = gets.split.map(&:to_i)
values = gets.split.map(&:to_i)

$memo = {}

def dfs(pos, fuel, cargo, taken, n, w, values)
  return 0 if fuel == 0
  
  key = [pos, fuel, cargo.sort, taken.sort]
  return $memo[key] if $memo.key?(key)
  
  max_value = 0
  
  if pos == 1 && !cargo.empty?
    unload_value = cargo.map { |station| values[station - 2] }.sum
    max_value = unload_value + dfs(1, fuel, [], taken, n, w, values)
  end
  
  [pos - 1, pos + 1].each do |next_pos|
    next if next_pos < 1 || next_pos > n || fuel < 1
    
    new_fuel = fuel - 1
    
    max_value = [max_value, dfs(next_pos, new_fuel, cargo, taken, n, w, values)].max
    
    if next_pos > 1 && !taken.include?(next_pos) && cargo.size < w
      new_cargo = cargo + [next_pos]
      new_taken = taken + [next_pos]
      max_value = [max_value, dfs(next_pos, new_fuel, new_cargo, new_taken, n, w, values)].max
    end
  end
  
  $memo[key] = max_value
  max_value
end

result = dfs(1, d, [], [], n, w, values)
puts result
