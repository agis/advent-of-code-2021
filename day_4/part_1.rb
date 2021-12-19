require "matrix"

input = ARGF.read.split("\n").reject(&:empty?)
picked_numbers = input.shift.split(",").map(&:to_i)
boards = input.map { |a| a.scan(/\d+/).map(&:to_i) }.each_slice(5)

boards = boards.each_with_object({}) do |board, h|
  h[Matrix[*board]] = Matrix.build(5, 5) { 1 }
end

picked_numbers.each do |picked|
  boards.each do |board, scores|
    board.each_with_index do |n, row, col|
      scores[row, col] = 0 if n == picked

      if (scores.column_vectors+scores.row_vectors).any? { |x| x.sum.zero? }
        puts picked * board.combine(scores) { |a, b| a*b }.sum
        exit 0
      end
    end
  end
end
