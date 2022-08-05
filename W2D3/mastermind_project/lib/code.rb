require 'byebug'
class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(arr)
    arr.all? {|char| POSSIBLE_PEGS.has_key?(char.upcase)}
  end

  def initialize(arr)
    unless Code.valid_pegs?(arr)
      raise ArgumentError.new "Invalid Pegs"
    end
    @pegs = arr.map {|peg| peg.upcase}
  end

  def self.random(length)
    random_pegs = []
    length.times {random_pegs << POSSIBLE_PEGS.keys.sample}
    Code.new(random_pegs)
  end

  def self.from_string(str)
    Code.new(str.split(""))
  end

  def [](idx)
    return @pegs[idx]
  end

  def length
    return @pegs.length
  end

  def num_exact_matches(guess)
    count = 0
    guess.pegs.each_with_index do |guess_peg, guess_idx|
      count+=1 if @pegs[guess_idx] == guess_peg
    end
    return count
  end

  def num_near_matches(guess)
    hash = Hash.new(0)
    count = 0 # 1 2 3
    @pegs.each {|peg| hash[peg]+=1} # {R=>1, G=>0, B=>0}

    guess.pegs.each do |peg| # RGRB // RGBB
      #debugger
      if hash.has_key?(peg) && hash[peg] > 0
        hash[peg]-=1
        count+=1
      end
    end
    count - num_exact_matches(guess)
  end

  def ==(code)
    @pegs == code.pegs
  end

end
