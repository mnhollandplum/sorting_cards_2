require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/card.rb'
require './lib/guess.rb'
require './lib/deck.rb'
require './lib/round.rb'

class RoundTest < Minitest::Test
  def test_round_exists_and_holds_deck
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_instance_of Round, round

    assert_equal deck, round.deck

  end

  def test_round_starts_with_no_guesses
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal [], round.guesses
  end

  def test_round_starts_with_first_card_in_the_deck
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal card_1, round.current_card

  end

  def test_round_can_record_a_guess
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    guess = round.record_guess({value: "3", suit: "Hearts"})

    assert_equal "3 of Hearts", guess.response

    assert_equal card_1, guess.card


    # assert_equal 1, round.number_correct
  end

  def test_round_can_count_guesses
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    guess = round.record_guess({value: "3", suit: "Hearts"})

    assert_equal 1, round.guesses.count
  end

  def test_round_gives_feedback_for_correct_guess
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    guess = round.record_guess({value: "3", suit: "Hearts"})

    assert_equal "Correct!", round.guesses.first.feedback
  end

  def test_round_can_count_correct_guesses
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    guess = round.record_guess({value: "3", suit: "Hearts"})

    assert_equal 1, round.number_correct
  end

  def test_cards_shift_in_round_after_correct_guess
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    guess = round.record_guess({value: "Jack", suit: "Diamonds"})

    assert_equal card_2, round.current_card
  end

  def test_guess_count_updates
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    guess = round.record_guess({value: "3", suit: "Hearts"})
    guess = round.record_guess({value: "Jack", suit: "Diamonds"})
    assert_equal 2, round.guesses.count
    binding.pry
  end

  def test_round_gives_feedback_for_incorrect_guess
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    guess = round.record_guess({value: "3", suit: "Hearts"})
    guess = round.record_guess({value: "Jack", suit: "Diamonds"})
    assert_equal "Incorrect.", round.guesses.last.feedback
  end

  def test_round_counts_correct_guesses_after_multiple_guesses
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    guess = round.record_guess({value: "3", suit: "Hearts"})
    guess = round.record_guess({value: "Jack", suit: "Diamonds"})
    assert_equal 1, round.number_correct
  end

  def test_round_is_able_to_calculate_the_percentage_correct
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    guess = round.record_guess({value: "3", suit: "Hearts"})
    guess = round.record_guess({value: "Jack", suit: "Diamonds"})
    assert_equal 50, round.percent_correct
  end


end
