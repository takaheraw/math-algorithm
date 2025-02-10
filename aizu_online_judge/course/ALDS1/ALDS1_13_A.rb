k = gets.to_i
placed = {}
k.times do
  r, c = gets.split.map(&:to_i)
  placed[r] = c
end

def backtrack(r, placed, columns, diag1, diag2, queens)
  if r == 8
    return queens
  end

  if placed.key?(r)
    c = placed[r]
    if columns.include?(c) || diag1.include?(r - c) || diag2.include?(r + c)
      return nil
    end

    new_columns = columns.dup
    new_columns.add(c)
    new_diag1 = diag1.dup
    new_diag1.add(r - c)
    new_diag2 = diag2.dup
    new_diag2.add(r + c)
    new_queens = queens.dup
    new_queens[r] = c

    result = backtrack(r + 1, placed, new_columns, new_diag1, new_diag2, new_queens)
    return result
  else
    (0..7).each do |c|
      next if columns.include?(c) || diag1.include?(r - c) || diag2.include?(r + c)

      new_columns = columns.dup
      new_columns.add(c)
      new_diag1 = diag1.dup
      new_diag1.add(r - c)
      new_diag2 = diag2.dup
      new_diag2.add(r + c)
      new_queens = queens.dup
      new_queens[r] = c

      result = backtrack(r + 1, placed, new_columns, new_diag1, new_diag2, new_queens)
      return result if result
    end
    nil
  end
end

queens = backtrack(0, placed, Set.new, Set.new, Set.new, {})

# Build the board
board = Array.new(8) { '.' * 8 }

queens.each do |r, c|
  board[r][c] = 'Q'
end

board.each { |row| puts row }
