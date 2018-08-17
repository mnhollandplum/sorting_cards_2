require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/card.rb'
require './lib/guess.rb'

class GuessTest < Minitest::Test
  def test_guess_exists
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)

    assert_instance_of Guess, guess
  end

  def test_guess_has_card_attributes_and_can_change
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    guess = Guess.new("10 of Hearts", card)

    assert_equal card, guess.card

    assert_equal "10 of Hearts", guess.response
  end

  def test_can_determine_if_guess_is_correct
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)

    assert_equal true, guess.correct?
  end

  def test_will_give_feedback_for_a_correct_guess
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)

    assert "Incorrect.", guess.feedback
  end

  def test_can_determine_if_guess_is_incorrect
    card = Card.new("Queen", "Clubs")
    guess = Guess.new("2 of Diamonds", card)

    assert_equal guess.card, card

    assert_equal "2 of Diamonds", guess.response

    assert_equal false, guess.correct?

  end

  def test_will_give_feedback_for_a_incorrect_guess
    card = Card.new("Queen", "Clubs")
    guess = Guess.new("2 of Diamonds", card)

    assert_equal "Incorrect.", guess.feedback
  end





end
