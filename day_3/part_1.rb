scores = Hash.new(0)
lines = ARGF.to_a.map(&:chomp)

lines.each do |l|
  l.each_char.each_with_index { |c, i| scores[i] += c.to_i }
end

gamma = scores.map { |s| s[1] > lines.count/2 ? "1" : "0" }.join
epsilon = gamma.tr("10", "01")

puts gamma.to_i(2) * epsilon.to_i(2)
