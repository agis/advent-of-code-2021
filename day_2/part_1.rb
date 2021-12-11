pos = depth = 0

ARGF.each do |ins|
  i, s = ins.split
  s = s.to_i

  case i
  when "forward" then pos += s
  when "up"      then depth -= s
  when "down"    then depth += s
  end
end

puts pos * depth
