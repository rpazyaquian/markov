class Markov
  attr_accessor :chain

  def learn(text)
    words = text.split(" ")

    chain = Hash.new(Array.new)

    words[0..-3].each_index do |i|
      key = words[i, 2].join(" ")
      value = words[i+2, 1].first
      if not chain.has_key? key
        chain[key.to_sym] = []
      end
      chain[key.to_sym] << value
    end

    self.chain = chain
  end

  def speak
    message = []
    key = self.chain.keys.sample.to_s
    message << key
    message.flatten!
    while self.chain.has_key? key
      value = self.chain[key].sample
      message << value
      key = [key.split(" ")[1], value].join(" ")
    end
    message.join(" ")
  end

end