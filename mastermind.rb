require_relative 'response'

class Mastermind

  attr_reader :colors, :guess, :correct_colors, :colors_positions, :guess_counter

  def initialize
    @guess_counter = 0
  end

#creates an array of 4 random colors
  def color_gen
    @colors = []
    #@colors = ["G", "Y", "B", "B"]  #Test Array
    4.times do
      if rand(1..4) == 1
        @colors << "G"
      elsif rand(1..4) == 2
        @colors << "R"
      elsif rand(1..4) == 3
        @colors << "B"
      else
        @colors << "Y"
      end #if
    end #do
    @colors
  end #def

#creates an array out of GUESS input
  def guess_gen(input)
    @guess = []
    input.each_char do |char|
      @guess << char.upcase
    end
    @guess = @guess.take(4)
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

  def compare
    if @correct_positions == 4
      Response.new(:message => "You Win! It only took you #{@guess_counter} guesses!", :status => :won)
    elsif @guess.include?("Q")
      Response.new(:message => "Exiting...", :status => :quit)
     elsif @guess.include?("C")
       Response.new(:message => "#{@colors}. If ya ain't cheatin\', ya ain't tryin\'.", :status => :continue)
    else
      Response.new(:message => "\'#{@guess}\' had #{@correct_positions} correct positions with #{@correct_colors} correct colors! Guess again!", :status => :continue)
    end
  end#def

  def guess_counter
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
    printer = Response.new(:message => nil, :status => :continue)
    printer.play
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
