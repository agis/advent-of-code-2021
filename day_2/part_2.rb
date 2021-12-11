pos = depth = aim = 0

ARGF.each do |ins|
  i, s = ins.split
  s = s.to_i

  case i
  when "up"      then aim -= s
  when "down"    then aim += s
  when "forward"
    pos += s
    depth += aim * s
  end
end

puts pos * depth
