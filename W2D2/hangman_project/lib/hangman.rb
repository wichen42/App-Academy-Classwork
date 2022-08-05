class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def Hangman.random_word
    return DICTIONARY.sample
  end
  
  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length) {"_"}
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remove_instance_variable
    @remaining_incorrect_guesses
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    @attempted_chars.each {|attempt| return true if attempt == char}
    return false
  end

  def get_matching_indices(char)
    arr = []
    @secret_word.each_char.with_index {|letter, i| arr << i if letter == char}
    return arr
  end

  def fill_indices(char, idx_arr)
    idx_arr.each do |i|
      @guess_word.each_with_index do |ele, word_i|
        @guess_word[i] = char if i == word_i
      end
    end
  end
###############################################################################
#                                   PART 2                                    #
###############################################################################

  def try_guess(char)
    if already_attempted?(char)
      p "that has already been attempted"
      return false
    else
      @attempted_chars << char
      if get_matching_indices(char).empty?
        @remaining_incorrect_guesses-=1
      else
        fill_indices(char, get_matching_indices(char))
      end
    end
    return true
  end

  def ask_user_for_guess
    p "Enter a char:"
    char = gets.chomp

    try_guess(char)
  end

  def win?
    if @guess_word.join("") == @secret_word
      p "WIN"
      return true
    end
    return false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p "LOSE"
      return true
    end
    return false
  end

  def game_over?
    if win? || lose?
      p @secret_word
      return true
    end
    return false
  end

end
