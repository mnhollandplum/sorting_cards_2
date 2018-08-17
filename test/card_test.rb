require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/card.rb'

class CardTest < Minitest::Test
  def test_card_exists
    card = Card.new("Ace", "Spades")
    assert_instance_of Card, card
  end

  def test_card_has_a_value
    card = Card.new("Ace", "Spades")
    assert_equal "Ace", card.value
  end

  def test_card_has_a_suit
    card = Card.new("Ace", "Spades")
    assert_equal "Spades", card.suit
  end

  def test_card_attributes_can_be_added_together
    card = Card.new("Ace", "Spades")
    assert_equal 144, card.total_card_value
  end
end
