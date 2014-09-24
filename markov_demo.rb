require_relative 'lib/markov'

markov = Markov.new

markov.learn(ARGF.read.chomp)

puts "Markov says:"
puts markov.speak