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
    assert_equal ["G", "Y", "B", "B"], mastermind.colors
  end

  def test_it_can_compare_guesses_and_colors
    mastermind = Mastermind.new()
    mastermind.color_gen
    mastermind.guess_gen("gggg")
    assert_equal "You had 4 correct positions with 4 correct colors!", mastermind.compare
  end

  def test_it_can_quit
  end

  def test_it_can_run_cheat_mode
  end
  #write some more tests dumb dumb


end
