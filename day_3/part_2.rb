input = ARGF.map(&:chomp)

def scores(lines)
  lines.each_with_object(Hash.new(0)) do |line, scores|
    line.chars.each_with_index { |c, i| scores[i] += c.to_i }
  end
end

puts([["0", "1"], ["1", "0"]].map do |bits|
  lines = input.dup

  0.upto(lines.first.size) do |charpos|
    break if lines.count == 1

    target = scores(lines)[charpos] < lines.size/2.0 ? bits[0] : bits[1]

    i = 0
    loop do
      break if lines.count == 1 || lines[i].nil?

      if lines[i][charpos] == target
        i += 1
      else
        lines.delete_at(i)
      end
    end
  end

  lines[0].to_i(2)
end.inject(:*))
