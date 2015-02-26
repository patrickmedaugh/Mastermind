require_relative 'response'

class Mastermind

  attr_reader :colors, :guess, :correct_colors, :colors_positions, :guess_counter, :mode

  def initialize
    @guess_counter = 0
  end

#creates an array of character amount and color amount based on difficulty input
  def difficulty(input)
    if input.upcase == "B"
      @mode = [4, 4]
      puts "Beginner Difficulty"
    elsif input.upcase == "I"
      @mode = [6, 5]
      puts "Intermediate Difficulty"
    elsif input.upcase == "H"
      @mode = [8, 6]
      puts "Hard Difficulty"
    else
      puts "Please input (B)eginner, (I)ntermediate, or (H)ard."
    end
  end

#creates an array of 4 random colors
  def color_gen
    @colors = []
    @colors = ["G", "Y", "B", "B"]  #Test Array
    # @mode[0].times do
    #   if 1 + rand(@mode[1]) == 1
    #     @colors << "G"
    #   elsif 1 + rand(@mode[1]) == 2
    #     @colors << "R"
    #   elsif 1 + rand(@mode[1]) == 3
    #     @colors << "B"
    #   elsif @mode[1] > 4 && 1 + rand(@mode[1]) == 5
    #     @colors << "W"
    #   elsif @mode[1] > 5 && 1 + rand(@mode[1]) == 6
    #     @colors << "P"
    #   else
    #     @colors << "Y"
    #   end #if
    # end #do
    @colors
  end #def

#creates an array out of GUESS input
  def guess_gen(input)
    @guess = []
    input.each_char do |char|
      @guess << char.upcase
    end
    @guess
  end

#compares the colors at each index to count matches of color & position
  def compare_positions
    @correct_positions = 0
    answer = @colors
    match = nil
    @guess.each_with_index do |n, index|
      if answer[index] == @guess[index]
        @correct_positions += 1
      end#if
    end#do
    @correct_positions
  end#def

#compares the colors guessed against the answer array. If we find a match in the
#answer array we remove it to avoid double counting.
  def compare_colors
    @correct_colors = 0
    answer = @colors.dup
    @guess.each do |g|
      if answer.include? g
        match = answer.find_index(g)
        answer[match] = nil
      @correct_colors += 1
    end#if
    end#do
    @correct_colors
  end#def

#validates guess and returns response message
  def compare
    if @guess.include?("Q")
      Response.new(:message => "Exiting...", :status => :quit)
    elsif @guess.include?("C")
       Response.new(:message => "#{@colors}. If ya ain't cheatin\', ya ain't tryin\'.", :status => :continue)
    elsif @guess.size > @mode[0]
      Response.new(:message => "That guess is too long. Please guess #{@mode[0]} colors: (r)ed, (g)reen, (b)lue, or (y)ellow.")
    elsif @guess.size != @mode[0]
      Response.new(:message => "That guess is too short. Please guess #{@mode[0]} colors: (r)ed, (g)reen, (b)lue, or (y)ellow.")
    elsif @correct_positions == @mode[0]
      Response.new(:message => "You Win! It only took you #{@guess_counter} guesses!", :status => :won)
    else
      Response.new(:message => "\'#{@guess}\' had #{@correct_positions} correct positions with #{@correct_colors} correct colors! Guess again!", :status => :continue)
    end
  end#def


  def guess_count
    @guess_counter += 1
  end

  def time
    Time.now
  end



#PRINTS MESSAGES
  def print_menu
    printer = Response.new(:message => nil, :status => :continue)
    printer.menu
  end

  def print_play
    if @mode[0] == 4
      "I have generated a beginner sequence with 4 elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
    elsif @mode[0] == 6
      "I have generated an intermediate sequence with 6 elements made up of: (r)ed, (g)reen, (b)lue, (y)ellow, and (w)hite. Use (q)uit at any time to end the game."
    elsif @mode[0] == 8
      "I have generated a hard sequence with 8 elements made up of: (r)ed, (g)reen, (b)lue, (y)ellow, (w)hite, and (p)urple. Use (q)uit at any time to end the game."
    end
  end

  def print_quit
    printer = Response.new(:message => nil, :status => :continue)
    printer.quit
  end

  def print_instruct
    string = nil
    printer = Response.new(:message => nil, :status => :continue)
    printer.instructions
  end

  def print_exception
    string = nil
    printer = Response.new(:message => nil, :status => :continue)
    printer.exception
  end

end
