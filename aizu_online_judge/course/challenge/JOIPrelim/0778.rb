def make_row(n); "\0" * (n * 2); end

def get_ushort(str, idx)
  str.getbyte(idx * 2) | (str.getbyte(idx * 2 + 1) << 8)
end

def set_ushort(str, idx, val)
  str.setbyte(idx * 2,  val & 0xFF)
  str.setbyte(idx * 2 + 1, val >> 8)
end

n = STDIN.readline.to_i
grid = Array.new(n) { STDIN.readline.chomp }

dr  = Array.new(n) # ↘︎
dl  = Array.new(n) # ↙︎
ur  = Array.new(n) # ↗︎

(n - 1).downto(0) do |i|
  row = make_row(n)
  row_down = dr[i + 1] if i + 1 < n
  (n - 1).downto(0) do |j|
    val = 1
    if i + 1 < n && j + 1 < n &&
       grid[i].getbyte(j) == grid[i + 1].getbyte(j + 1)
      val += get_ushort(row_down, j + 1)
    end
    set_ushort(row, j, val)
  end
  dr[i] = row
end

(n - 1).downto(0) do |i|
  row = make_row(n)
  row_down = dl[i + 1] if i + 1 < n
  0.upto(n - 1) do |j|
    val = 1
    if i + 1 < n && j.positive? &&
       grid[i].getbyte(j) == grid[i + 1].getbyte(j - 1)
      val += get_ushort(row_down, j - 1)
    end
    set_ushort(row, j, val)
  end
  dl[i] = row
end

0.upto(n - 1) do |i|
  row = make_row(n)
  row_up = ur[i - 1] if i.positive?
  (n - 1).downto(0) do |j|
    val = 1
    if i.positive? && j + 1 < n &&
       grid[i].getbyte(j) == grid[i - 1].getbyte(j + 1)
      val += get_ushort(row_up, j + 1)
    end
    set_ushort(row, j, val)
  end
  ur[i] = row
end

best_r = 0
max_flowers = 1

0.upto(n - 1) do |x|
  0.upto(n - 1) do |y|
    edge = [x, y, n - 1 - x, n - 1 - y].min
    next if edge <= best_r

    k = 0
    loop do
      val1 = get_ushort(dr[x],       y - k) - (k + 1)
      val3 = get_ushort(dr[x - k],   y)     - (k + 1)
      val2 = get_ushort(dl[x + k],   y)     - (k + 1)
      val4 = get_ushort(ur[x - k],   y)     - (k + 1)
      inc  = [val1, val2, val3, val4].min
      break if inc <= 0
      inc = edge - k if edge - k < inc
      k  += inc
    end

    if k > best_r
      best_r = k
      max_flowers = 2 * k * k + 2 * k + 1
    end
  end
end

puts max_flowers
