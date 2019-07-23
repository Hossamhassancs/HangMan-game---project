class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end
  
  def initialize
   @secret_word = Hangman.random_word
   @guess_word=Array.new(@secret_word.length,"_")
   @attempted_chars=[]
   @remaining_incorrect_guesses=5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(ch)
    if @attempted_chars.include?(ch)
      return true
    else
      return false
    end
  end

  def get_matching_indices(ch)
    matching_indices=[]
    @secret_word.each_char.with_index do |char,i|
      if ch==char
        matching_indices<<i
      end
    end
    matching_indices
  end

  def fill_indices(ch,arr)
    arr.each do |i|
      @guess_word[i]=ch
     end
  end

  def try_guess(ch)
    if self.already_attempted?(ch)
      puts "'that has already been attempted'"
      return false
    end

    @attempted_chars<<ch
    matches=self.get_matching_indices(ch)
    self.fill_indices(ch,matches)

    if matches.empty?
       @remaining_incorrect_guesses-=1
    end

    true

  end
  
  def ask_user_for_guess
    puts "Enter a char"
    inp=gets.chomp
    return self.try_guess(inp)
  end

  def win?
    if @secret_word==guess_word.join("")
      puts "WIN"
      return true
    else
      return false
    end
  end
   
  def lose?
    if @remaining_incorrect_guesses==0
      puts "LOSE"
      return true
    else
      return false
    end
  end
   
  def game_over?
    if self.win?||self.lose?
     puts @secret_word
     return true
    else
      return false
    end
  end

end
