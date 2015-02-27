require 'minitest/autorun'
require 'minitest/pride'
require './mastermind'

class Mastermindtest < Minitest::Test

  def test_it_has_an_array_of_colors_guessed
    mastermind = Mastermind.new()
    assert_equal ['G', 'G', 'B', 'R'], mastermind.guess_gen("ggbr")
  end

  def test_it_can_generate_a_color
    skip#
    mastermind = Mastermind.new()
    mastermind.color_gen
    assert_equal "G", mastermind.colors[0]
  end

  def test_it_can_generate_an_array_of_four_colors
    skip#
    mastermind = Mastermind.new()
    mastermind.color_gen
    assert_equal ["G", "Y", "B", "B"], mastermind.colors
  end

  def test_it_can_compare_guesses_and_colors
    skip
    mastermind = Mastermind.new()
    mastermind.difficulty("B")
    mastermind.color_gen
    mastermind.guess_gen("gybb")
    mastermind.compare_positions
    mastermind.compare_colors
    response = mastermind.compare
    message = response.message
    assert_equal "You had 4 correct positions with 4 correct colors!", message
  end

  def test_it_can_give_a_too_short_error_message
    mastermind = Mastermind.new()
    mastermind.difficulty("B")
    mastermind.color_gen
    mastermind.guess_gen("gyb")
    mastermind.compare_positions
    mastermind.compare_colors
    response = mastermind.compare
    message = response.message
    assert_equal "That guess is too short. Please guess 4 colors: (r)ed, (g)reen, (b)lue, or (y)ellow.", message
  end

  def test_it_can_give_a_too_long_error_message
    mastermind = Mastermind.new()
    mastermind.difficulty("B")
    mastermind.color_gen
    mastermind.guess_gen("gybbb")
    mastermind.compare_positions
    mastermind.compare_colors
    response = mastermind.compare
    message = response.message
    assert_equal "That guess is too long. Please guess 4 colors: (r)ed, (g)reen, (b)lue, or (y)ellow.", message
  end

  def test_it_can_return_the_correct_number_of_colors
    mastermind = Mastermind.new()
    mastermind.difficulty("B")
    mastermind.color_gen
    mastermind.guess_gen("bggg")
    mastermind.compare_positions
    mastermind.compare_colors
    response = mastermind.compare
    message = response.message
    assert_equal "'[\"B\", \"G\", \"G\", \"G\"]' had 0 correct positions with 2 correct colors! Guess again!", message
  end

  def test_it_can_quit
    mastermind = Mastermind.new()
    mastermind.difficulty("B")
    mastermind.color_gen
    mastermind.guess_gen("q")
    mastermind.compare_positions
    mastermind.compare_colors
    response = mastermind.compare
    assert_equal :quit, response.status
  end

  def test_it_can_run_cheat_mode
    mastermind = Mastermind.new()
    mastermind.difficulty("B")
    mastermind.color_gen
    mastermind.guess_gen("c")
    mastermind.compare_positions
    mastermind.compare_colors
    response = mastermind.compare
    assert_equal "[\"G\", \"Y\", \"B\", \"B\"]. If ya ain\'t cheatin\', ya ain't tryin\'.", response.message
  end

  def test_it_can_win
    mastermind = Mastermind.new()
    mastermind.difficulty("B")
    mastermind.color_gen
    mastermind.guess_gen("gybb")
    mastermind.compare_positions
    mastermind.compare_colors
    response = mastermind.compare
    status = response.status
    assert_equal :won, status
  end

  def test_it_can_count_number_of_guesses
    mastermind = Mastermind.new()
    3.times{mastermind.guess_count}
    assert_equal 4, mastermind.guess_count
  end

  def test_it_can_calculate_time_played
    skip
  end

  def test_it_can_print_menu
    mastermind = Mastermind.new
    response = mastermind.print_menu
    assert_equal "Would you like to (p)lay a game of Mastermind? Read the (i)nstructions or (q)uit?",response
  end

  def test_it_can_print_instructions
    mastermind = Mastermind.new
    string = "Here are some instructions on how to play Mastermind: Take turns guessing colors in a randomly generated sequence. The game will tell you how many correct colors you guessed and how many correct colors at the correct positions you guessed. Try to guess the sequence of colors in as few guesses as possible. Please select (p)lay, (i)nstructions, or (q)uit."
    response = mastermind.print_instruct
    assert_equal string, response
  end

  def test_it_can_print_play_message
    skip
    mastermind = Mastermind.new
    response = mastermind.print_play
    assert_equal "", response
  end

  def test_it_can_print_exception_message
    mastermind = Mastermind.new
    response = mastermind.print_exception
    assert_equal "I didn't catch that. Please select (p)lay, (i)nstructions, or (q)uit.", response
  end

end
