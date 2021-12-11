puts ARGF.map(&:to_i).each_cons(2).count { |e| e[1] > e[0] }
