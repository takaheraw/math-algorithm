n, m, k = gets.split.map(&:to_i)
s = gets.chomp
t = gets.chomp

def solve(s, t, k)
  n, m = s.length, t.length
  
  memo = {}
  
  def dp(i, j, last_k_chars, s, t, k, memo)
    return 0 if i == s.length && j == t.length
    
    key = [i, j, last_k_chars]
    return memo[key] if memo.key?(key)
    
    result = Float::INFINITY
    
    chars = []
    
    if i < s.length && j < t.length && s[i] == t[j]
      chars << s[i]
    else
      chars << s[i] if i < s.length
      chars << t[j] if j < t.length
    end
    
    chars += ['A', 'B', 'C', 'a', 'b', 'c']
    chars.uniq!
    
    chars.each do |char|
      valid = true
      if k > 0
        (1..[k, last_k_chars.length].min).each do |d|
          if last_k_chars[-d] == char
            valid = false
            break
          end
        end
      end
      
      next unless valid
      
      new_i = i + (i < s.length && s[i] == char ? 1 : 0)
      new_j = j + (j < t.length && t[j] == char ? 1 : 0)
      new_last_k_chars = (last_k_chars + char).slice(-k-1, k+1) || ""
      
      sub_result = dp(new_i, new_j, new_last_k_chars, s, t, k, memo)
      result = [result, sub_result + 1].min if sub_result < Float::INFINITY
    end
    
    memo[key] = result
    result
  end
  
  dp(0, 0, "", s, t, k, memo)
end

def solve_iterative(s, t, k)
  n, m = s.length, t.length
  
  max_length = n + m + k * (n + m) / 2
  
  current = {}
  current[[0, 0]] = [""] # 最後のk文字を記録
  
  (1..max_length).each do |length|
    next_states = {}
    
    current.each do |(i, j), last_chars_list|
      last_chars_list.each do |last_chars|
        candidates = []
        
        if i < n && j < m && s[i] == t[j]
          candidates = [s[i]]
        else
          candidates << s[i] if i < n
          candidates << t[j] if j < m
          candidates += ['A', 'B', 'a', 'b'] if candidates.empty?
        end
        
        candidates.uniq.each do |char|
          valid = true
          if k > 0 && last_chars.length > 0
            (1..[k, last_chars.length].min).each do |d|
              if last_chars[-d] == char
                valid = false
                break
              end
            end
          end
          
          next unless valid
          
          new_i = i + (i < n && s[i] == char ? 1 : 0)
          new_j = j + (j < m && t[j] == char ? 1 : 0)
          
          return length if new_i == n && new_j == m
          
          new_last_chars = (last_chars + char)
          new_last_chars = new_last_chars[-(k+1)..-1] if new_last_chars.length > k + 1
          
          key = [new_i, new_j]
          next_states[key] ||= []
          next_states[key] << new_last_chars unless next_states[key].include?(new_last_chars)
        end
      end
    end
    
    current = next_states
    break if current.empty?
  end
  
  -1
end

def solve_greedy(s, t, k)
  result = []
  i = j = 0
  
  while i < s.length || j < t.length
    target_char = nil
    
    if i < s.length && j < t.length && s[i] == t[j]
      target_char = s[i]
    elsif i < s.length && (j >= t.length || s.length - i >= t.length - j)
      target_char = s[i]
    elsif j < t.length
      target_char = t[j]
    end
    
    while k > 0 && result.length >= k + 1
      conflict = false
      (1..k).each do |d|
        if result[-d] == target_char
          conflict = true
          break
        end
      end
      
      break unless conflict
      
      filler = ['A', 'B', 'C', 'a', 'b', 'c'].find do |c|
        ok = true
        (1..[k, result.length].min).each do |d|
          if result[-d] == c
            ok = false
            break
          end
        end
        ok
      end
      
      result << (filler || 'X')
    end
    
    result << target_char
    
    i += 1 if i < s.length && s[i] == target_char
    j += 1 if j < t.length && t[j] == target_char
  end
  
  result.length
end

puts solve_greedy(s, t, k)
