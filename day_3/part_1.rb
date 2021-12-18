scores = Hash.new(0)
input = ARGF.map(&:chomp)

input.each do |l|
  l.chars.each_with_index { |c, i| scores[i] += c.to_i }
end

gamma = scores.map { |s| s[1] > input.size/2 ? "1" : "0" }.join
epsilon = gamma.tr("10", "01")

puts gamma.to_i(2) * epsilon.to_i(2)
