require_relative 'response'

class Mastermind

  attr_reader :colors, :guess, :correct_colors, :colors_positions, :guess_counter, :mode

  def initialize
    @guess_counter = 0
  end

  def guess_count
    @guess_counter += 1
  end

  def time
    Time.now
  end

#sets the difficulty setting
  def difficulty(input)
    difficulty_level = input.upcase
    case difficulty_level
    when "B"
      @mode = [4, 4]
      puts "Beginner Difficulty"
    when "I"
      @mode = [6, 5]
      puts "Intermediate Difficulty"
    when "H"
      @mode = [8, 6]
      puts "Hard Difficulty"
    else
      puts "Please input (B)eginner, (I)ntermediate, or (H)ard."
    end
  end


#creates an array of random colors based on difficulty setting
  def color_gen
    @colors = []
    number_of_chars = @mode[0]
    number_of_colors = @mode[1]
    case number_of_colors
    when 4
      color_options = ["G", "R", "Y", "B"]
    when 5
      color_options = ["G", "R", "Y", "B", "W"]
    when 6
      color_options = ["G", "R", "Y", "B", "W", "P"]
    end
    number_of_chars.times do
      @colors << color_options.sample
    end
    @colors
    @colors = ["G", "Y", "B", "B"]  #Test Array
  end

#creates an array out of GUESS input
  def guess_gen(input)
    @guess = []
    input.each_char do |char|
      @guess << char.upcase
    end
    @guess
  end

#counts the number of color & position matches
  def compare_positions
    @correct_positions = 0
    answer = @colors
    match = nil

    @guess.each_with_index do |n, index|
      if answer[index] == @guess[index]
        @correct_positions += 1
      end
    end

    @correct_positions
  end

#counts the number of just color matches
  def compare_colors
    @correct_colors = 0
    answer = @colors.dup

    @guess.each do |g|
      if answer.include? g
        match = answer.find_index(g)
        answer[match] = nil
      @correct_colors += 1
      end
    end

    @correct_colors
  end

#in-game response message
  def compare
    number_of_chars = @mode[0]
    player_input = @guess

    if player_input.include?("Q")
      Response.new(:message => "Exiting...", :status => :quit)
    elsif player_input.include?("C")
       Response.new(:message => "#{@colors}. If ya ain't cheatin\', ya ain't tryin\'.", :status => :continue)
    elsif player_input.size > number_of_chars
      Response.new(:message => "That guess is too long. Please guess #{number_of_chars} colors.")
    elsif player_input.size != number_of_chars
      Response.new(:message => "That guess is too short. Please guess #{number_of_chars} colors.")
    elsif @correct_positions == number_of_chars
      Response.new(:message => "You Win! It only took you #{@guess_counter} guesses!", :status => :won)
    else
      Response.new(:message => "\'#{player_input}\' had #{@correct_positions} correct positions with #{@correct_colors} correct colors! Guess again!", :status => :continue)
    end
  end

#menu messages
  def print_play
    printer = Response.new(:message => nil, :status => :continue)
    number_of_elements = @mode[0]
    case number_of_elements
    when 4
      printer.beginner
    when 6
      printer.intermediate
    when 8
      printer.hard
    end
  end

  def play_again
    printer = Response.new(:message => nil, :status => :continue)
    printer.again
  end

  def print_menu
    printer = Response.new(:message => nil, :status => :continue)
    printer.menu
  end


  def print_quit
    printer = Response.new(:message => nil, :status => :continue)
    printer.quit
  end

  def print_difficulty
    printer = Response.new(:message => nil, :status => :continue)
    printer.difficult
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
