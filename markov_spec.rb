require_relative 'lib/markov'

describe Markov do

  before(:all) do
    @markov = Markov.new
  end

  describe '#learn' do
    it "creates a Markov chain from text input" do
      @markov.learn("my name is mud")
      expect(@markov.chain).to eq({:"my name"=>["is"], :"name is"=>["mud"]})
    end
  end

  describe '#speak' do
    it "creates a string of at most 140 chars" do
      response = @markov.speak
      puts response
      expect(response.length).to be <= 140
    end
  end

end