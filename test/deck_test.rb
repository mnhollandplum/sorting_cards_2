require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/card.rb'
require './lib/guess.rb'
require './lib/deck.rb'

class DeckTest < Minitest::Test
  def test_deck_has_cards
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    assert_equal [card_1, card_2, card_3], deck.cards
  end

  def test_deck_can_count_cards
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    assert_equal 3, deck.count
  end

  def test_deck_can_sort_cards
    card_1 = Card.new("4","Hearts")
    card_2 = Card.new("Jack", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    card_4 = Card.new("Ace", "Spades")
    card_5 = Card.new("Ace", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3, card_4, card_5])

    assert_equal [card_1, card_3, card_2, card_5, card_4], deck.sort
  end

  # def test_deck_can_merge_sort
  #   card_1 = Card.new("4","Hearts")
  #   card_2 = Card.new("Jack", "Clubs")
  #   card_3 = Card.new("5", "Diamonds")
  #   card_4 = Card.new("Ace", "Spades")
  #   card_5 = Card.new("Ace", "Diamonds")
  #   deck = Deck.new([card_1, card_2, card_3, card_4, card_5])
  #
  #
  #   assert_equal [card_1, card_3, card_2, card_5, card_4], deck.merge_sort
  # end
end
