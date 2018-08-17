require 'pry'
class Deck
    attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def sort
    deck = @cards.length


    loop do
      sorted_cards = false

      (deck-1).times do |sort|
        if cards[sort].total_card_value > cards[sort+1].total_card_value
          cards[sort], cards[sort+1] = cards[sort+1], cards[sort]
          sorted_cards = true
        end
      end
      break if sorted_cards == false
      binding.pry
    end
    return cards
  end


end
