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

  def clone
    Die.new(@faces)
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

  # Rotate the die to the left (counterclockwise)
  def rotate_left
    @faces[F], @faces[R], @faces[B], @faces[L] = @faces[R], @faces[B], @faces[L], @faces[F]
  end
end

# Read the dice faces
a_faces = gets.strip.split.map(&:to_i)
b_faces = gets.strip.split.map(&:to_i)

die_a = Die.new(a_faces)
die_b_faces = b_faces

orientations = []

# Generate all 24 orientations of die_a
def generate_orientations(die)
  orientations = []
  6.times do |i|
    4.times do
      orientations << die.faces.clone
      die.rotate_right
    end
    if i == 0
      die.roll_north
    elsif i == 1
      die.roll_east
    elsif i == 2
      die.roll_south
    elsif i == 3
      die.roll_south
    elsif i == 4
      die.roll_east
    else
      die.roll_east
    end
  end
  orientations
end

orientations = generate_orientations(die_a)

# Check if any orientation matches die_b
identical = orientations.any? { |faces| faces == die_b_faces }

puts identical ? "Yes" : "No"
