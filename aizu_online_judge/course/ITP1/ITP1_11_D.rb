class Die
  attr_accessor :faces

  T = 0  # top
  F = 1  # front
  R = 2  # right
  L = 3  # left
  B = 4  # back
  D = 5  # bottom

  def initialize(faces)
    @faces = faces.clone
  end

  # Rotate the die to the north
  def roll_north
    @faces[T], @faces[F], @faces[D], @faces[B] = @faces[F], @faces[D], @faces[B], @faces[T]
  end

  # Rotate the die to the east
  def roll_east
    @faces[T], @faces[L], @faces[D], @faces[R] = @faces[L], @faces[D], @faces[R], @faces[T]
  end

  # Rotate the die to the south
  def roll_south
    @faces[T], @faces[B], @faces[D], @faces[F] = @faces[B], @faces[D], @faces[F], @faces[T]
  end

  # Rotate the die to the west
  def roll_west
    @faces[T], @faces[R], @faces[D], @faces[L] = @faces[R], @faces[D], @faces[L], @faces[T]
  end

  # Rotate the die to the right (clockwise)
  def rotate_right
    @faces[F], @faces[L], @faces[B], @faces[R] = @faces[L], @faces[B], @faces[R], @faces[F]
  end

  # Generate all 24 orientations of the die
  def orientations
    result = []
    6.times do
      4.times do
        result << @faces.clone
        rotate_right
      end
      roll_north if result.size < 24
    end
    result
  end
end

# Read input
n = gets.to_i
dices = Array.new(n) { gets.strip.split.map(&:to_i) }

# Generate all orientations for each die and use a set to track unique dice
unique_dices = []

dices.each do |faces|
  die = Die.new(faces)
  orientations = die.orientations.map(&:sort)
  
  # Check if any orientation matches an already seen dice
  if unique_dices.any? { |ud| orientations.include?(ud) }
    puts "No"
    exit
  end
  
  # Add one canonical orientation to the unique dice list
  unique_dices << orientations[0]
end

puts "Yes"
