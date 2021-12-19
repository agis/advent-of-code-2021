require "matrix"

input = ARGF.read.split("\n").reject(&:empty?)
picked_numbers = input.shift.split(",").map(&:to_i)
boards = input.map { |a| a.scan(/\d+/).map(&:to_i) }.each_slice(5)

boards = boards.each_with_object({}) do |board, h|
  h[Matrix[*board]] = Matrix.build(5, 5) { 1 }
end

winning_boards = {}

picked_numbers.each do |picked|
  boards.each do |board, scores|
    board.each_with_index do |n, row, col|
      scores[row, col] = 0 if n == picked

      if (scores.column_vectors+scores.row_vectors).any? { |v| v.sum.zero? }
        winning_boards[board] ||= picked
        break
      end
    end
  end
end

board, picked = winning_boards.to_a.last
puts picked * board.combine(boards[board]) { |a,b| a*b }.sum
