require 'minitest/autorun'
require 'minitest/pride'
require './mastermind'

class Mastermindtest < Minitest::Test

  def test_it_has_an_array_of_colors_guessed
    mastermind = Mastermind.new()
    assert_equal ['G', 'G', 'B', 'R'], mastermind.guess_gen("ggbr")
  end

  def test_it_can_generate_a_color
    skip
    mastermind = Mastermind.new()
    mastermind.color_gen
    assert_equal ["G"], mastermind.colors
  end

  def test_it_can_generate_an_array_of_four_colors
    #skip
    mastermind = Mastermind.new()
    mastermind.color_gen
    mastermind.compare_colors
    mastermind.compare_positions
    assert_equal ["G", "Y", "B", "B"], mastermind.colors
  end

  def test_it_can_compare_guesses_and_colors
    mastermind = Mastermind.new()
    mastermind.color_gen
    mastermind.guess_gen("gybb")
    mastermind.compare_colors
    mastermind.compare_positions
    assert_equal "You had 4 correct positions with 4 correct colors!", mastermind.compare
  end

  def test_it_can_give_a_too_short_error_message
  end

  def test_it_can_give_a_too_long_error_message
  end

  def test_it_can_return_the_correct_number_of_colors
  end

  def test_it_can_quit
  end

  def test_it_can_run_cheat_mode
  end

  def test_it_can_win
  end

  def test_it_can_count_number_of_guesses
  end

  def test_it_can_calculate_time_played
  end

  def test_it_can_print_menu
  end

  def test_it_can_print_instructions
  end

  def test_it_can_print_play_message
  end

  def test_it_can_print_exception_message
  end
  #write some more tests dumb dumb


end
