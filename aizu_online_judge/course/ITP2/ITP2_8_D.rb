class MultiMap
  def initialize
    @map = Hash.new { |h, k| h[k] = [] }
    @keys = []
  end

  def insert(key, x)
    @keys << key unless @map.key?(key)
    @map[key] << x
  end

  def get(key)
    return unless @map.key?(key)
    @map[key].each { |v| puts v }
  end

  def delete(key)
    @map.delete(key)
    @keys.delete(key)
  end

  def dump(l, r)
    sorted_keys = @keys.select { |k| l <= k && k <= r }.sort
    sorted_keys.each do |key|
      @map[key].each { |v| puts "#{key} #{v}" }
    end
  end
end

multimap = MultiMap.new
q = gets.to_i

q.times do
  query = gets.chomp.split
  case query[0]
  when "0"
    multimap.insert(query[1], query[2].to_i)
  when "1"
    multimap.get(query[1])
  when "2"
    multimap.delete(query[1])
  when "3"
    multimap.dump(query[1], query[2])
  end
end
