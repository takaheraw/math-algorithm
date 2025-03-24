# Bit Mask Operations Solution

class BitMask
  def initialize
    @state = 0
    @masks = []
  end

  def add_mask(k, bits)
    mask = 0
    bits.each { |b| mask |= (1 << b) }
    @masks << mask
  end

  def test(i)
    puts (@state & (1 << i)) > 0 ? 1 : 0
  end

  def set(m)
    @state |= @masks[m]
  end

  def clear(m)
    @state &= ~@masks[m]
  end

  def flip(m)
    @state ^= @masks[m]
  end

  def all(m)
    puts (@state & @masks[m]) == @masks[m] ? 1 : 0
  end

  def any(m)
    puts (@state & @masks[m]) > 0 ? 1 : 0
  end

  def none(m)
    puts (@state & @masks[m]) == 0 ? 1 : 0
  end

  def count(m)
    puts @masks[m].to_s(2).count('1')
  end

  def val(m)
    puts @state & @masks[m]
  end
end

# Read input
n = gets.to_i
bit_mask = BitMask.new

# Read masks
n.times do
  input = gets.split.map(&:to_i)
  k = input[0]
  bits = input[1..-1]
  bit_mask.add_mask(k, bits)
end

# Process queries
q = gets.to_i
q.times do
  query = gets.split.map(&:to_i)
  op, arg = query

  case op
  when 0 then bit_mask.test(arg)
  when 1 then bit_mask.set(arg)
  when 2 then bit_mask.clear(arg)
  when 3 then bit_mask.flip(arg)
  when 4 then bit_mask.all(arg)
  when 5 then bit_mask.any(arg)
  when 6 then bit_mask.none(arg)
  when 7 then bit_mask.count(arg)
  when 8 then bit_mask.val(arg)
  end
end
